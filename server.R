library(shiny)
library(rCharts)
library(ggplot2)
diamonds2 <- diamonds[sample(nrow(diamonds),1000),]
by_cut <- diamonds2[order(diamonds2$cut),]
by_color <- diamonds2[order(diamonds2$color),]
by_clarity <- diamonds2[order(diamonds2$clarity),]

shinyServer(function(input, output) {
    output$myChart <- renderChart2({
        data <- switch(input$factor, 
                       "Cut" = 'cut',
                       "Color" = 'color',
                       "Clarity" = 'clarity')
        if (data == 'cut')
        {n1 <- nPlot(price~carat,group=data,data=by_cut[(by_cut$price >= input$price[1] & by_cut$price <= input$price[2] & by_cut$carat >= input$carat[1] & by_cut$carat <= input$carat[2]),],type="scatterChart",id='myChart')
        n1$xAxis(axisLabel = "Carat")
        n1$yAxis(axisLabel= "Price")}
        else if (data == 'color')
        {n1 <- nPlot(price~carat,group=data,data=by_color[(by_color$price >= input$price[1] & by_color$price <= input$price[2] & by_color$carat >= input$carat[1] & by_color$carat <= input$carat[2]),],type="scatterChart",id='myChart')
        n1$xAxis(axisLabel = "Carat")
        n1$yAxis(axisLabel= "Price")} 
        else 
        {n1 <- nPlot(price~carat,group=data,data=by_clarity[(by_clarity$price >= input$price[1] & by_clarity$price <= input$price[2] & by_clarity$carat >= input$carat[1] & by_clarity$carat <= input$carat[2]),],type="scatterChart",id='myChart')
        n1$xAxis(axisLabel = "Carat")
        n1$yAxis(axisLabel= "Price")} 
        return(n1)
    })
})



