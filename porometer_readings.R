library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

######################## conductance ############################

df <- read_excel("porometer_lygra_august.xlsx")

df_avg <- summarise(
  group_by(drop_na(df, humidity), age_class, drought_level),
  conductance_mean = mean(conductance),
  .groups = "drop")

plot1 <- ggplot(data = df_avg, mapping = aes(x = age_class, y = conductance_mean, colour = drought_level)) + geom_point()

plot1

######################## for conductance under 400 ###############################

df_avg_trim <- filter(df, conductance < 600)

df_avg_trim <- summarise(
  group_by(df_avg_trim, age_class, drought_level),
  conductance_mean = mean(conductance),
  .groups = "drop")

plot2 <- ggplot(data = df_avg_trim, mapping = aes(x = age_class, y = conductance_mean, colour = drought_level)) + geom_point()

plot2
               
