## Librerias

library(tidyverse)
library(ggthemes)
library(readxl)

## Datos

dolar <- read_excel("Desktop/Indicador.xls",col_types = c("date", "numeric"))


# Gráfico

dolar %>% 
  ggplot(aes(x = Dia, y = Valor)) +
  geom_line(color = "blue", size = 1.25) +
  labs(title = "Valor Dolar",
       subtitle = "2022",
       caption = "Fuente: Elaboración Propia en Base Banco Central") +
  theme_economist()
