options(rgl.useNULL=TRUE)

selDataTableOutput <- function (outputId) 
{
    tagList(singleton(
        tags$head(
            tags$link(rel = "stylesheet", 
                      type = "text/css", href = "shared/datatables/css/dataTables.bootstrap.css"),
            tags$link(rel = "stylesheet", type="text/css", 
                      href="shared/datatables/css/dataTables.extra.css"), 
            tags$style(type="text/css", 
                       ".rowsSelected td{
                   background-color: rgba(112,164,255,0.2) !important}"),
            tags$style(type="text/css", 
                       ".selectable div table tbody tr{
                   cursor: hand; cursor: pointer;}"),
            tags$script(src = "shared/datatables/js/jquery.dataTables.min.js"), 
            tags$script(src = "shared/datatables/js/dataTables.bootstrap.js"),
            tags$script(src = "js/DTbinding.js")
        )), 
        div(id = outputId, class = "shiny-datatable-output selectable"))
}
