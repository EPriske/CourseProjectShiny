library(shiny)
library(plotly)
covid <- read.csv2("CovidData.csv")
covid$cumulative_confirmed <- as.integer(covid$cumulative_confirmed)
covid$cumulative_deceased <- as.integer(covid$cumulative_deceased)

ui <- fluidPage(
  
  titlePanel("Covid confirmed cases filtering by Sub-Region"),
  
  sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "region",
          label = "Sub Region",
          choices = list("Australia and New Zealand","Central Asia",
                    "Eastern Asia", "Eastern Europe", "Latin America and the Caribbean",
                    "Melanesia", "Micronesia", "Northern Africa", 
                    "Northern America", "Northern Europe", "
                    Polynesia", "South-eastern Asia", "Southern Asia",
                    "Southern Europe", "Sub-Saharan Africa",
                    "Western Asia", "Western Europe"))
                    ),
          mainPanel(plotlyOutput("CovidCases", height = "350px", width = "100%"))
                ),)

server <- function(input, output) {
  output$CovidCases <- renderPlotly({
    covid <- read.csv2("CovidData.csv")
    covid$cumulative_confirmed <- as.integer(covid$cumulative_confirmed)
    covid$cumulative_deceased <- as.integer(covid$cumulative_deceased)
    covid <- filter(covid, Sub.region == input$region)
    
    # light grey boundaries
    l <- list(color = toRGB("grey"), width = 0.5)
    
    # specify map projection/options
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      projection = list(type = 'Mercator')
    )
    
    fig <- plot_geo(covid)
    fig <- fig %>% add_trace(
      z = ~cumulative_confirmed, color = ~cumulative_confirmed, colors = 'Blues',
      text = ~Country, locations = ~C_Code, marker = list(line = l)
    )
    fig <- fig %>% colorbar(title = 'Confirmed Covid Cases', tickprefix = '$')
    fig <- fig %>% layout(
      title = 'Cumulative Global COVID confirmed cases <br>Source:<a href="https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-open-data?_ga=2.171800480.-1216389741.1637654717&project=courseralearning-311312>
COVID-19 Open Data</a>',
      geo = g
    )
    
    fig})
}

shinyApp(ui = ui, server = server)
