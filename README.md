lissajous_playground
====================

R [shiny](http://shiny.rstudio.com) app to play with lissajous figures

##Context
This toy application was built as a course project in the context of the coursera course [Developing Data Products](https://www.coursera.org/course/devdataprod).

I didn't want to make one more of the more or less silly "analyses" of the data sets available in R and its package system. Therefore I decided to try to implement something that - for me - was interesting to play with and that allowed me to learn some important features of shiny. 

##Goals
My goals were:  

* Plot some of the beautiful lissajous-figures using the [shinyRGL interface by trestletech](http://trestletech.github.io/shinyRGL/) to produce interactive 3D plots in WebGL.

* Build a simple interface to select parameters to produce the [lissajous-figures](http://en.wikipedia.org/wiki/Lissajous_curve).

* Add a feature to let the user save the parameters that produce interesting figures.

* Let the user review the figures that others found interesting by interactively selecting a row in a shiny DataTable. The default [DataTable](http://shiny.rstudio.com/articles/datatables.html) implementation has no feature to select rows. I found a solution in this [discussion](https://groups.google.com/forum/#!topic/shiny-discuss/_zNZMR2gHn0) in the Google group about the shiny framework. The two files [global.R](http://github.com/skilchen/lissajous_playground/global.R) and [DTBinding.js](http://github.com/skilchen/lissajous_playground/www/js/DTbinding.js) are essentially slightly adapted (global.R) copies from [SelectableDataTables.zip](https://groups.google.com/group/shiny-discuss/attach/987db1d8d2b5dc3b/SelectableDataTables.zip?part=0.1).

* Store the parameters for interesting figures persistently across sessions, server restarts and application redeployments. In the following [article](http://shiny.rstudio.com/articles/share-data.html) I found hints on [mongoDB](http://www.mongodb.org), [rmongodb](http://cran.r-project.org/web/packages/rmongodb/index.html) and on free [MongoDB Hosting](https://mongolab.com). So I decided to learn some small pieces of modern NoSQL technology to implement my persistence goal.

That's it. You can try my toy application at [ShinyApps.io](http://skilchen.shinyapps.io/lissajous_playground) and get the code from [here](http://github.com/skilchen/lissajous_playground) and do with it whatever you want. The requested presentation is available at the projects [gh-pages](http://skilchen.github.io/lissajous_playground/pitch/index.html).

##Usage
My toy application doesn't need much explanation. Just [start it](http://skilchen.shinyapps.io/lissajous_playground) and play around. Try to drag/zoom the plotted figure. I find it very interesting how those figures change, depending on the viewpoint. (There might even be something to learn from this, if we make e.g. principal component analyses which often project some data on a low dimensional space and rotate the coordinate system according to some optimality criterion. Obviously this dimensionality reduction and rotation of the coordinate system may have a strong impact on how the "world" looks like.) 

If you like a figure that was plotted, click on the button "I like this figure!" and your selection of parameters should appear in the DataTable on the bottom of the main panel. The rows in this table are sorted according to the column "count". This column indicates how many times someone found the particulate figure interesting. 

If you close your browser and come back later your selection of parameters should still be there. The list of selected parameters should also survive application restarts or redeployments automatically done by shinyapps.io.

If you click on a row with parameters that someone found interesting, the corresponding lissajous figure should be reproduced. Please beware that sometimes the round trip to the mongoDB Database on mongolab takes a relatively long time. It might be, that my applications makes too many round trips to the database, but currently i don't have the time to search for the causes of these delays. 

I know, that my code is not well commented and that it has not enough error checking built in (especially concerning the communication with the remote mongoDB). But the time frame of this course project doesn't allow for more... and the overall quality of my code should not be too bad.
