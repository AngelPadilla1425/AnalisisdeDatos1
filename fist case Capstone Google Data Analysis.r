---
title: "Firts Case Bicycles 2024"
author: "Angel Padilla Reyes"
date: "09/2/2025"
output: html_notebook
---
## Introducction

 Welcome to the Cyclistic bike-share analysis case study! In this case study, you work for a
 fictional company, Cyclistic, along with some key team members. In order to answer the
 business questions, follow the steps of the data analysis process: Ask, Prepare, Process,
 Analyze, Share, and Act. Along the way, the Case Study Roadmap tables — including guiding
 questions and key tasks — will help you stay on the right path.

## Scenario

 You are a junior data analyst working on the marketing analyst team at Cyclistic,
 abike-share
 company in Chicago. The director of marketing believes the company’s future success
 depends on maximizing the number of annual memberships. Therefore, your team wants to
 understand how casual riders and annual members use Cyclistic bikes differently. From these
 insights, your team will design a new marketing strategy to convert casual riders into annual
 members. But first, Cyclistic executives must approve your recommendations, so they must be
 backed up with compelling data insights and professional data visualizations.

## Characters and teams

 Cyclistic: A bike-share program that features more than 5,800 bicycles and 600
 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand
 tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
 and riders who can’t use a standard two-wheeled bike. The majority of riders opt for
 traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more
 likely to ride for leisure, but about 30% use the bikes to commute to work each day.

 Lily Moreno: The director of marketing and your manager. Moreno is responsible for
 the development of campaigns and initiatives to promote the bike-share program.
 These may include email, social media, and other channels.

## Ask

Three questions will guide the future marketing program:
 1. How do annual members and casual riders use Cyclistic bikes differently?
 2. Why would casual riders buy Cyclistic annual memberships?
 3. How can Cyclistic use digital media to influence casual riders to become members?
 Moreno has assigned you the first question to answer: How do annual members and casual
 riders use Cyclistic bikes differently?
 You will produce a report with the following deliverables:
 1. A clear statement of the business task
 2. A description of all data sources used
 3. Documentation of any cleaning or manipulation of data
 4. A summary of your analysis
 5. Supporting visualizations and key findings
 6. Your top three recommendations based on your analysis

## Prepare
 The data is located in a publicly available datasets by Cyclistic and is made accessible due  to a link to Motivate International Inc. under a specific licence agreement. The data is      structured in a comma separated value (.csv) format and is in the structure of long Data. The  file contains columns for attributes such as trip id, start time, end time, bike id, trip     duration, from station name, to station id, to station name, user type, gender and birthyear.  Any potential issues with Bias could arise if the dataset does not equally represent all user  groups like causal riders and annual members. A careful review ensures that all relevant user  segments are included proportionately. The credibility of the data is ensured as the dataset  originates from Cyclistic’s actual historical trip records (1st party data).

 The data is Reliable as the dataset is provided by a trusted source which is Cyclistic; the   data is Original as it is sourced directly from Cyclistic’s operations; it is Comprehensive   as it includes detailed trip data covering key attributes for analysis; the data is Current   and covers the previous 12 months of trip data thereby ensuring relevance and the data is     Consistent due to the data structure and column formats are consistent across the files.      (ROCCC)

 The data set complies with the licensing requirements and does not include any personally  identifiable information (PII) in order to maintain user privacy. Proper file organisation and standard naming conventions enhance accessibility. To verify the data’s integrity, the data was reviewed for missing values, duplicates and outliers and calculations for derived fields were verified. The data set helps answer the question as it provides information about the user types, trip duration's and travel patterns, which therefore enables a comparison of behaviour between casual riders and annual members.

## Process
 1.-Open your spreadsheet and create a column called ride_length. Calculate the length
of each ride by subtracting the column started_at from the column ended_at (for
example, =D2-C2) and format as HH:MM:SS using Format > Cells > Time > 37:30:55.
 2. Create a column called day_of_week, and calculate the day of the week that each ride
started using the WEEKDAY command (for example, =WEEKDAY(C2,1)) in each file.
Format as General or as a number with no decimals, noting that 1 = Sunday and 7 =
Saturday.
 3. Proceed to the analyze step.

## Analyze
 Run a few calculations in one file to get a better sense of the data layout. Options:
  ● Calculate the mean of ride_length
  ● Calculate the max ride_length
  ● Calculate the mode of day_of_week
 5. Create a pivot table to quickly calculate and visualize the data. Options:
  ● Calculate the average ride_length for members and casual riders. Try rows =
 member_casual; Values = Average of ride_length.
  ● Calculate the average ride_length for users by day_of_week. Try columns =
 day_of_week; Rows = member_casual; Values = Average of ride_length.
  ● Calculate the number of rides for users by day_of_week by adding Count of
 trip_id to Values.
 6. Open another file and perform the same descriptive analysis steps. Explore different
 seasons to make some initial observations.
 7. Once you have spent some time working with the individual spreadsheets, merge them
 into a full-year view. Do this with the tool you have chosen to use to perform your final
 analysis, either a spreadsheet, a database and SQL, or R Studio.
 8. Export a summary file for further analysis.
 
## Data Change Log 

```{r install packages}
install.packages("tidyverse")
install.packages("janitor")
install.packages("lubridate")
library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)
```
## Loading csv files to rstudio

im only use csv files:

```{r loading files}
t1 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202401-divvy-tripdata.csv")
t2 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202402-divvy-tripdata.csv")
t3 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202403-divvy-tripdata.csv")
t4 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202404-divvy-tripdata.csv")
t5 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202405-divvy-tripdata.csv")
t6 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202406-divvy-tripdata.csv")
t7 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202407-divvy-tripdata.csv")
t8 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202408-divvy-tripdata.csv")
t9 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202409-divvy-tripdata.csv")
t10 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202410-divvy-tripdata.csv")
t11 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202411-divvy-tripdata.csv")
t12 <- read.csv("C:/Users/padil/Desktop/BicicletasP2/202412-divvy-tripdata.csv")
```
## Cleaning data 
 voy a proceder a limpiar los nombres de las columnas con espacios utilizando janitor
 rbind() concatena los dataframes fila por fila (deben tener las mismas columnas).str
 
```{r}
bike_rides <- rbind(t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12)
bike_rides <- janitor::remove_empty(bike_rides, which = c("cols"))
bike_rides <- janitor::remove_empty(bike_rides, which = c("rows"))
```
## usando el siguinte comando veremos las propiedades de los datos 
```{r}
str(bike_rides)
summary(bike_rides)
```
Despues de utilizar el comando vemos que las fechas no tienen los datos apropiados  started_at/ended_at estan como chr
vamos a cambiar el tipo de dato con el siguiente codigo
```{r}
bike_rides$started_at <- as.POSIXct(bike_rides$started_at, format="%Y-%m-%d %H:%M:%S")
bike_rides$ended_at <- as.POSIXct(bike_rides$ended_at, format="%Y-%m-%d %H:%M:%S")
```
Ahora puedo ejecutar una funcion para saber el tiempo de duracion de cada viaje
```{r}
bike_rides$ride_length <- difftime(bike_rides$ended_at, bike_rides$started_at, units="mins")
bike_rides$ride_length <- as.numeric(bike_rides$ride_length)
```
ahora vamos a crear una nueva columna para los dias de la semana, mes y año utilizando el siguiente comando

```{r}
bike_rides$day_of_week <- weekdays(bike_rides$started_at)
bike_rides$month <- months(bike_rides$started_at)
bike_rides$year <- year(bike_rides$started_at)
```
Ahora lo que voy a hacer es calcular media, maximo y minimo  de la variable ride_length agrupadas por miembro casual y miembro anual

```{r}
casual_member<- aggregate(ride_length ~ member_casual, bike_rides, mean)
```
calculamos tiempo de viaje más largo para cada tipo de usuario 

```{r}
max_member_casual <- aggregate(ride_length ~ member_casual, bike_rides, max)
```
calcular tiempo de viaje mas corto

```{r}
min_member_casual <- aggregate(ride_length ~ member_casual, bike_rides, min)

```

En los tiempos tuve un fallo exactamente en el mim_member_casual ya que me da datos negativos entonces voy a eliminar los datos negativos y luego volver a repetir este paso
Primero vamos a consultar cuantos datos tienen esta condicion

```{r}
sum(bike_rides$ride_length < 0)
```
El valor es de 227, entonces voy a proceder a borrar estos datos con el siguiente codigo 

```{r}
bike_rides <- bike_rides[bike_rides$ride_length >= 0, ]
```
## Share
A continuacion vamos a mostrar la grafica de Numero de alquileres por dia de semana
```{r}
library(ggplot2)
ggplot(data=bike_rides)+
  geom_bar(mapping=aes(x=day_of_week, fill=member_casual))+
  labs(
    title="Number of Rental per Day of the Week",
    x="Day of the Week",
    y="Number of Rentals",
    )
```
Vamos  ahcer un grafico por meses del año
```{r}
ggplot(mean_month, aes(x = month, y = ride_length, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(title = "Trend in Average Trip Duration per Month", 
       x = "month", 
       y = "Average Trip Duration (in minutes)") +
  theme_minimal() +
  scale_x_discrete(limits = month.name) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(plot.margin = margin(1, 1, 2, 1, "cm"))  # Ajustar los márgenes
```


```{r}
ggplot(casual_member, aes(x = member_casual, y = ride_length, fill = member_casual)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Trip Duration by User Type", 
       x = "User Tipe", 
       y = "Average Trip Duration (in minutes)") +
  theme_minimal()  # Tema limpio
```

##conclusion

*Members use the service more consistently during the week, while casual users have peaks on weekends.
*Days like Friday or Saturday are more popular for renting, due to recreational or leisure activities.
*Casual members have the most travel time compared to members.
*The months with the most rentals are from May to August, which are the summer months.
*If the data coincides with a special event or promotion during certain months, we can see a noticeable increase or decrease in trips.
*There are more casual cyclists than members. Members use their bikes more often on weekends than on weekdays. Therefore, it is possible to design a strategy to motivate casual cyclists to use their bikes on weekends as well.

 

