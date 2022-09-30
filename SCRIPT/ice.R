## Librerias
library(tidyverse)
library(lubridate)
library(ggthemes)
library(readxl)

## Datos

ice <- read_excel("Desktop/ice.xlsx")

## Gráfico

ice %>% 
  ggplot(aes(x = periodo, y = ice)) +
  geom_line(color = "blue", size = 1.25) + 
  labs(title = "Índice de Confianza Empresarial",
       subtitle = "Enero 2021 - Agosoto 2022",
       caption = "Fuente: Elaboración Propia en base Encuesta UDD") +
  theme_economist()
