library(shiny)
library(shinyRGL)

#' Define UI for application that lets you play with lissajou figures
#' @author Samuel kilchenmann \email{skilchen@@bluewin.ch}
shinyUI(pageWithSidebar(
  headerPanel("Shiny WebGL Lissajous Figures"),
  
  sidebarPanel(
      selectInput("waveform",
                  "Wave Form:",
                  choices = c("sine", "triangle"),
                  selected = "sine"),
      selectInput("plottype",
                  "Plot Type:",
                  choices = c("lines", "spheres"),
                  selected = "linesr"),
      
      helpText("Frequencies of the Wave in 3 dimensions:"),      
      numericInput("x", 
                   "Frequency x:", 
                   min = 1, 
                   max = 360, 
                   value = 2,
                   step = 1),
      numericInput("y", 
                   "Frequency y:", 
                   min = 1, 
                   max = 360, 
                   value = 1,
                   step = 1),
      numericInput("z", 
                   "Frequency z:", 
                   min = 1, 
                   max = 360, 
                   value = 3,
                   step = 1),
      actionButton("rndnr",
                   "Random Values for x, y, z"),
      actionButton("favorit",
                   "I like this figure!"),
      
      helpText(HTML("<hr/>","Created using ",
                    "<ul>",
                    "<li>",
                    "<a href = \"http://shiny.rstudio.com/\">Shiny</a>",
                    "A web application framework for R from the excellent people at",
                    "<a href = \"http://www.rstudio.com\">RStudio</a>",
                    "</li>",
                    "<li>",
                    "<a href = \"http://github.com/trestletech/shinyRGL\">shinyRGL</a>",
                    " to display the figure in a draggable and zoomable 3d webGL canvas",
                    "</li>",
                    "<li>",
                    "<a href = \"https://groups.google.com/forum/#!msg/shiny-discuss/_zNZMR2gHn0/2JalCXkyMvEJ\">SelectableDataTable</a>",
                    " to let you select parameters producing figures that other people liked.",
                    "</li>",
                    "<li>",
                    "<a href = \"http://www.mongodb.org/\">mongoDB</a> and the free mongoDB hosting service kindly provided by",
                    "<a href = \"https://mongolab.org\">mongolab</a> to get persistence for the favorite figure parameters across sessions and deployments using",
                    "<a href = \"http://cran.r-project.org/web/packages/rmongodb/index.html\">rmongodb</a>",
                    "the somewhat crazy but very usable R interface to mongoDB.",
                    "</li>",
                    "</ul>"
      ))
  ),
  
  mainPanel(
      "For background information please see the wikipedia articles ",
      a("Lissajous curve", href="http://en.wikipedia.org/wiki/Lissajous_curve"),
      "and", a("Lissajous knot", href="http://en.wikipedia.org/wiki/Lissajous_knot"),
      "Here we are only interested in the beauty of the resulting figures.",
      "The figures are defined by parametric equations of the form",
      "x = A * sin(a * t + d), ",
      "y = B * sin(b * t + e), ",
      "z = C * sin(c * t + f),",
      "where A,B,C define the amplitude, a,b,c define the frequency",
      "and d,e,f define the phase shift of the waves.", 
      "t is something like an independent variable varying over a defined range.",
      "For our playground we use A=B=C=1 and d=e=f=0,", "
      The values for the frequencies can be set using our simple interface on the lefthand panel.",
      HTML("<hr/>"),
      helpText("Click and drag to rotate figure. Use mouse wheel or middle button to zoom"),
      
      webGLOutput("myPlot", height=400),
      "Select a row in the table below to see what figures other people liked:",
      selDataTableOutput("favorites")
  )
))