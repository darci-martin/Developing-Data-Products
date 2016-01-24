library(shiny)
library(rCharts)
shinyUI(navbarPage("Diamonds Application",
    tabPanel("About",
    mainPanel(
    h2("About this Application"),
    p("This application uses a 1,000 sample subset of the Diamonds dataset from ggplot2."),
    p("The dataset is plotted with carat weight on the x-axis, and price along the y-axis.
      You can change the colors of the plot to reflect either Cut, Color, or Clarity. 
      You can also change the range of Price and range of Carat. This allows you to explore the impact the Four Cs have on round cut diamond price."),
    p("Cut is the quality of the cut, ranging from Fair > Good > Very Good > Premium > Ideal."),
    p("Color is the diamond color ranging from J (worst) to D (best)."),
    p("Clarity is a measurement of how clear the diamond is I1 (worst) > SI1 > SI2 > VS1 > VS2 > VVS1 > VVS2 > IF (Internally Flawless, best)."),
    p("Source code for this project can be found on ",
      a("GitHub.", 
        href = "https://github.com/darci-martin/Developing-Data-Products")))),
    tabPanel("Chart",
    pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
        helpText("Explore the impact the Four Cs have on the price of diamonds."),
        selectInput(inputId = "factor",
                    label = "Choose the C",
                    choices = c("Cut", "Color","Clarity"),
                    selected = "Cut"),
        sliderInput(inputId = "price",
                    label="Price Range",
                    min=326, max=18823, value=c(326,18823)),
        sliderInput(inputId = "carat",
                    label= "Carat Weight",
                    min=0.2, max=5, value=c(0.2,3))
    ),
    mainPanel(
        showOutput("myChart","nvd3")
    )))))