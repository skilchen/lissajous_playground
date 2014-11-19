library(rmongodb)

mongo_connect <- function(host="127.0.0.1", db="lissajous_playground") {
    host <- "ds053160.mongolab.com:53160"
    
    mongo <- mongo.create(host=host, db=db, username="demo", password="demo")
    return(mongo)
}

mongo_load_favorites <- function(mongo) {
    db <- "lissajous_playground"
    coll <- paste(db, "favorites", sep=".")
    favorites <- suppressWarnings(mongo.find.all(mongo, ns = coll, data.frame = TRUE))
    if(nrow(favorites) > 0) {
        return(favorites[order(-favorites$count),])
    }
    else {
        df <- (data.frame(x=2, y=1, z=3, plottype="lines", waveform="sine", count=1,
                          stringsAsFactors=FALSE))
        lst <- as.list(df)
        bs <- mongo.bson.from.list(lst)
        mongo.insert(mongo, coll, bs)
        return(df)
    }
}
    
mongo_update_favorites <- function(mongo, db, x, y, z, pltype="line", wf="sine", count=1) {
    lst <- list(x=x, y=y, z=z, plottype=pltype, waveform=wf)
    bs <- mongo.bson.from.list(lst)
    cu <- mongo.find(mongo, db, bs)
    if (mongo.cursor.next(cu)) {
        val <- mongo.cursor.value(cu)
        lst <- mongo.bson.to.list(val)
        lst$count <- lst$count + count
        mongo.update(mongo, db, bs, mongo.bson.from.list(lst))
    }
    else {
        lst$count <- 1
        mongo.insert(mongo, db, mongo.bson.from.list(lst))
    }
}
    
    