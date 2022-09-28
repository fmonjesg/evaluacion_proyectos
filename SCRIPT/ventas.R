#Librerias

library(tidyverse)
library(lubridate)
library(ggthemes)
library(readxl)

# Datos

Venta <- read_excel("C:/Users/Notebook/Desktop/Venta.xlsx", 
                    col_types = c("text", "numeric", "numeric", 
                                  "numeric", "date", "numeric", "numeric"))

# Gráfico

Venta %>% 
  ggplot(aes(x = fecha, y = var12)) + 
  geom_line(color = "blue", size = 1.25) +
  labs(title = "Venta al por menor de alimentos, bebidas y tabaco en comercio no especializado",
       subtitle = "Enero 2015 a Julio 2022",
       caption = "Fuente: Elaboración propia en base a INE",
       x = "Fecha",
       y = "Variación 12 meses") +
  theme_economist()
         


Venta %>% 
  filter(fecha > "2019-12-01") %>% 
  ggplot(aes(x = fecha, y = var12)) +
  geom_line(color = "blue", size = 1.25) +
  geom_vline(xintercept = as.POSIXct(as.Date("2019-12-19")),
             linetype=4, colour="red", size = 1) + 
  geom_vline(xintercept = as.POSIXct(as.Date("2020-03-18")),
             linetype=3, colour="red", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2020-07-30")),
             linetype=4, colour="orange", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2020-12-10")),
             linetype=4, colour="orange", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2021-04-28")),
             linetype=4, colour="orange", size = 1) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-02-01")), y = 0.3, 
                label = "Estallido \nSocial")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-09-09")), y = 0.35, 
                label = "Retiro \n1")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-02-01")), y = 0.35, 
                label = "Retiro \n2")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-06-28")), y = 0.5, 
                label = "Retiro \n3")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-04-30")), y = 0.2, 
                label = "Pandemia"))+
  labs(title = "Venta al por menor de alimentos, bebidas y tabaco en comercio no especializado",
       subtitle = "Enero 2020 a Julio 2022",
       caption = "Fuente: Elaboración propia en base a INE",
       x = "Fecha",
       y = "Variación 12 meses") +
  theme_economist()
