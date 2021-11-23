# CourseProjectShiny
Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch
## Summary

My objective with this Application is to be able to quickly search the name of the interested country and then it will display the cumulative confirmed cases of covid as well as the cumulative confirmed deaceses caused by covid. The data comes from "COVID-19 Open Data" and it is from "BigQuery Public Datasets Program". Here is a small description of the dataset:

"This repository contains the largest COVID-19 epidemiological database available in addition to a powerful set of expansive covariates. It includes open sourced data with a permissive license (enabling commercial use) relating to vaccinations, epidemiology, hospitalizations, demographics, economy, geography, health, mobility, government response, weather, and more. Moreover, the data merges daily time-series from hundreds of data sources at a fine spatial resolution, containing over 20,000 locations and using a consistent set of region keys."

## SQL Code used in Google Cloud

SELECT country_name, cumulative_confirmed, cumulative_deceased 
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`

Link to acces the datasert: https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-open-data?_ga=2.171800480.-1216389741.1637654717&project=courseralearning-311312

The dataset was summarized by Country, confirmed cases of Covid and confirmed number of deceased by Covid. The dataset was saved localy and then uploaded to Rstudio. We do some data exploration.

## Shiny Application "Cumulative confirmed Covid cases".

```{r echo=FALSE, message=FALSE}
library(plotly)
covid <- read.csv2("CovidData.csv")
covid$cumulative_confirmed <- as.integer(covid$cumulative_confirmed)
covid$cumulative_deceased <- as.integer(covid$cumulative_deceased)

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

fig

```

## Shiny Application "Cumulative confirmed deceased by Covid".

```{r echo=FALSE, message=FALSE}
# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

figD <- plot_geo(covid)
figD <- figD %>% add_trace(
    z = ~cumulative_deceased, color = ~cumulative_deceased, colors = 'Reds',
    text = ~Country, locations = ~C_Code, marker = list(line = l)
  )
figD <- figD %>% colorbar(title = 'Confirmed Covid Deceased', tickprefix = '$')
figD <- figD %>% layout(
    title = 'Cumulative Global COVID confirmed deceased <br>Source:<a href="https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-open-data?_ga=2.171800480.-1216389741.1637654717&project=courseralearning-311312>
COVID-19 Open Data</a>',
    geo = g
  )

figD
```
