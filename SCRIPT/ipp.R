## Librerias

library(tidyverse)
library(ggthemes)
library(readxl)

## Datos

ipp <- read_excel("Desktop/ipp.xlsx")

## Gráfico

glimpse(ipp)

ipp %>% 
  filter(Glosa == "Hormigón premezclado") %>% 
  ggplot(aes( x = fecha, y = `Variación\r\nMensual    (% )` )) +
  geom_line(color = "blue", size = 1.25) +
  labs(title = "Variación Mensual Precio Hormigón Premezclado",
       subtitle = "2017 - 2022",
       caption = "Fuente: Elaboración Propia en base a INE") +
  theme_economist()


ipp %>% 
  filter(Glosa == "Pinturas y barnices") %>% 
  ggplot(aes( x = fecha, y = `Variación\r\nMensual    (% )` )) +
  geom_line(color = "blue", size = 1.25) +
  labs(title = "Variación Mensual Precio Pinturas y barnices",
       subtitle = "2017 - 2022",
       caption = "Fuente: Elaboración Propia en base a INE") +
  theme_economist()
