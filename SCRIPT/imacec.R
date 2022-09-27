# Librerias

library(tidyverse)
library(readxl)
library(ggthemes)

# Datos

imacec <- read_excel("C:/Users/Notebook/Desktop/imacec.xlsx", 
                     col_types = c("date", "numeric", "numeric", "numeric", "numeric"))


# Gráfico

imacec %>% 
  ggplot() +
  geom_bar(aes(x = Periodo, y = var12), stat = "identity", color = "blue") +
  geom_line(aes(x = Periodo, y = des), size = 1.25, color = "red") +
  labs(title = "Imacec",
       subtitle = "Mayo 2014 - Julio 2022",
       caption = "Fuente: Elaboración Propia en base a Datos Banco Central.",
       y = "") + 
  theme_economist()
