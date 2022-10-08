## Librerias

library(tidyverse)
library(ggthemes)
library(readxl)

## Datos

tpm <- read_excel("Desktop/tpm.xlsx")

# Gráfico

tpm %>% 
  ggplot(aes(x = Fecha, y = TPM)) +
  geom_line(color = "blue", size = 1.25) +
  labs(title = "Tasa de Política Monetaria",
       subtitle = "1997 - 2022",
       caption = "Fuente: Elaboración Propia en Base Banco Central") +
  theme_economist()

