## Librerias
library(tidyverse)
library(readxl)
library(ggthemes)

## Datos

pib_pc <- read_excel("Desktop/pib_pc.xls",  sheet = "Hoja1")

## Gráfico

pib_pc %>% 
  ggplot(aes(x = year, y = `GDP per capita, PPP (constant 2017 international $)`)) + 
  geom_line(color = "red", size = 1.25) + 
  labs(title = "PIB Per Cápita",
       subtitle = "19'0 - 2021",
       caption = "Fuente: Eleboración Propia con Datos Banco Mundial",
       x = "Periodo", 
       y = "") + 
  theme_economist()
