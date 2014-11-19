# Must be executed BEFORE rgl is loaded on headless devices.
options(rgl.useNULL=TRUE)

library(shiny)
library(shinyRGL)
library(rgl)
library(rmongodb)
source("mongodb_cmds.R")

load_favorites <- function() {
    file_name <- "favorites.csv"
    if(file.exists(file_name)) {
        favorites <- read.csv(file_name, header=TRUE, stringsAsFactor=FALSE)
        if(nrow(favorites)==0) {
            favorites <- data.frame(x=2, y=3, z=3,
                                    plottype="lines", waveform="sine", count=1)
        }
    }  
    else {
        favorites <- data.frame(x=2, y=3, z=3,
                                plottype="lines", waveform="sine", count=1)
    }
    return(favorites)
}

save_favorites <- function() {
    write.csv(favorites, file="favorites.csv", row.names=FALSE)
}

update_favorites <- function(a, b, c, pltype="line", wf="sine", count=1) {
    idx <- with(favorites,which(x==a & y==b & z == c & 
                                    plottype==pltype & 
                                    waveform==wf))
    if(length(idx)>0) {
        lst <- as.list(favorites[idx,])
        lst$count <- list$count + 1
        favorites[idx,"count"] <<- favorites[idx,"count"] + count
    }
    else {
        lst <- list(x=a, y=b, z=c,
                    plottype=pltype, waveform=wf,
                    count=1)
        favorites <<- rbind(favorites, 
                            data.frame(x=a, y=b, z=c,
                                       plottype=pltype, waveform=wf, 
                                       count=1))
    }
}

t <- seq(0, 2*pi, length.out = 3*360) 

lissajous <- function(a, b, c, A=1, B=1, C=1, 
                      delta_x=0,
                      delta_y=0,
                      delta_z=0,
                      plottype="line",
                      waveform="sine") {
    if(waveform=="sine") {
        x <- A*sin(a*t+delta_x)
        y <- B*sin(b*t+delta_y)
        z <- C*sin(c*t+delta_z)
    }
    else {
        x <- A*asin(sin(a*t))
        y <- B*asin(sin(b*t))
        z <- C*asin(sin(c*t))
    }
    isolate({
        if(plottype=="spheres") {
            spheres3d(x, y, z, col=rainbow(720), radius=0.08)
        }
        else {
            lines3d(x, y, z, col=rainbow(720))
        }
    })
}

favorites <- load_favorites()

shinyServer(function(input, output, session) {
    session$mongo <- mongo_connect()
    session$mongo_ns <- "lissajous_playground.favorites"
    session$actionNbr <- 0
    session$favClicked <- 0

    if(mongo.is.connected(session$mongo)) {
        favorites <- mongo_load_favorites(session$mongo)
    }
    observe({
        if(input$favorit > session$favClicked) {
            session$favClicked <- session$favClicked + 1
            if(mongo.is.connected(session$mongo)) {
                mongo_update_favorites(session$mongo,
                                       session$mongo_ns,
                                       input$x, input$y, input$z,
                                       pltype=input$plottype,
                                       wf=input$waveform,
                                       count=1)
                favorites <<- mongo_load_favorites(session$mongo)
            }
            else {
                update_favorites(input$x, input$y, input$z, 
                                 pltype=input$plottype, 
                                 wf=input$waveform, count=1)
            }
        }
    })
    
    getPlotParams <- reactive({
        x <- input$x
        y <- input$y
        z <- input$z
        wf <- input$waveform
        plottype <- input$plottype
        return(list(x=x,y=y,z=z,plottype=plottype,
                    waveform=wf))
    })
    
    doIt <- reactive({
        k <- c(input$x, input$y, input$z, input$plottype)
        if (input$rndnr > session$actionNbr ) {
            session$actionNbr <- input$rndnr
            
            res <- sample(1:9,3,replace=FALSE)
            x <- res[1]
            y <- res[2]
            z <- res[3]
            
            updateNumericInput(session, "x", value = x)
            updateNumericInput(session, "y", value = y)
            updateNumericInput(session, "z", value = z)
        }
        else {
            parms <- getPlotParams()
            output$myPlot <- renderWebGL({
                lissajous(parms$x, parms$y, parms$z, 
                          waveform=parms$waveform, 
                          plottype=parms$plottype)
            })
        }
    })
    
    getData <- reactive({
        if(input$favorit > session$favClicked) {
            session$favClicked <- session$favClicked + 1
            if(mongo.is.connected(session$mongo)) {
                mongo_update_favorites(session$mongo,
                                       session$mongo_ns,
                                       input$x, input$y, input$z,
                                       input$plottype, input$waveform, 1)
                favorites <- mongo_load_favorites(session$mongo)
            }
            else {
                update_favorites(input$x, input$y, input$z, 
                                 input$plottype, input$waveform, 1)
            }
        }
        favorites[order(-favorites$count),]
    })
    
    output$favorites <- renderDataTable({
        doIt()
        getData()
    }, options = list(orderClasses = TRUE, pageLength = 5, 
                      paging = TRUE,
                      lengthMenu = c(5,10),
                      searching=TRUE))
    
    session$onSessionEnded(function() {
        save_favorites()
        if(mongo.is.connected(session$mongo)) {
            mongo.destroy(session$mongo)
        }
    })
    
    observe({
        lst <- input$favorites
        if(length(lst) > 3) {
            x <- lst[1]
            y <- lst[2]
            z <- lst[3]
            plottype <- lst[4]
            waveform <- lst[5]
            updateNumericInput(session, "x", value = x)
            updateNumericInput(session, "y", value = y)
            updateNumericInput(session, "z", value = z)
            updateSelectInput(session, "plottype", selected=plottype)
            updateSelectInput(session, "waveform", selected=waveform)
        }
    })
})