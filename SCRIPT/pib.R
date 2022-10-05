## Librerias

library(tidyverse)
library(readxl)
library(ggthemes)

## Datos

pib <- read_excel("Desktop/pib.xls", sheet = "Hoja1")

## Gráfico

pib %>% 
  ggplot(aes(x = as.numeric(year), y = `GDP growth (annual %)`)) + 
  geom_line(color = "red", size = 1.25) + 
  labs(title = "Vairación del PIB",
       subtitle = "1961 - 2021",
       caption = "Fuente: Eleboración Propia con Datos Banco Mundian",
       x = "Periodo", 
       y = "Variación Porcentual") + 
  theme_economist()
