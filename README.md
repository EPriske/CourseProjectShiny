# CourseProjectShiny
Peer-graded Assignment: Course Project: Shiny Application and Reproducible Pitch

## Summary

My objective with this Application is to be able to quickly search the name of the interested country and then it will display the cumulative confirmed cases of covid as well as the cumulative confirmed deaceses caused by covid. The data comes from "COVID-19 Open Data" and it is from "BigQuery Public Datasets Program". Here is a small description of the dataset:

"This repository contains the largest COVID-19 epidemiological database available in addition to a powerful set of expansive covariates. It includes open sourced data with a permissive license (enabling commercial use) relating to vaccinations, epidemiology, hospitalizations, demographics, economy, geography, health, mobility, government response, weather, and more. Moreover, the data merges daily time-series from hundreds of data sources at a fine spatial resolution, containing over 20,000 locations and using a consistent set of region keys."

In the repository you can find all the documents used for this assigment.

## Links to see the Presentation and App.


# Presentation

https://rpubs.com/EPriske/Week4T

# App

https://erick-priske.shinyapps.io/Week4/




## SQL Code used in Google Cloud

SELECT country_name, cumulative_confirmed, cumulative_deceased 
FROM `bigquery-public-data.covid19_open_data.covid19_open_data`

Link to acces the datasert: https://console.cloud.google.com/marketplace/product/bigquery-public-datasets/covid19-open-data?_ga=2.171800480.-1216389741.1637654717&project=courseralearning-311312

The dataset was summarized by Country, confirmed cases of Covid and confirmed number of deceased by Covid. The dataset was saved localy and then uploaded to Rstudio. We do some data exploration.

