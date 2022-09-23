library(tidyverse)
library(readxl)
library(lubridate)

anac <- read_excel("C:/Users/Notebook/Desktop/anac.xlsx")

anac %>% 
  ggplot(aes(x = fecha_dup, y = ventas)) +
  geom_smooth(color = "blue",
            size = 1.25, se = FALSE) +
  geom_vline(xintercept = as.POSIXct(as.Date("2019-10-19")),
             linetype=4, colour="red", size = 1) + 
  geom_vline(xintercept = as.POSIXct(as.Date("2020-03-18")),
             linetype=3, colour="red", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2020-07-30")),
             linetype=4, colour="orange", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2020-12-10")),
             linetype=4, colour="orange", size = 1) +
  geom_vline(xintercept = as.POSIXct(as.Date("2021-04-28")),
             linetype=4, colour="orange", size = 1) +
  labs(title = "Cantidad Total de Vehículos Vendidos",
       caption = "Fuente: Elaboración Propia en base a ANAC.",
       x = "Fecha",
       y = "Ventas") +
  geom_text(aes(x = as.POSIXct(as.Date("2020-01-01")), y = 35000, 
                               label = "Estallido \nSocial")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-09-09")), y = 35000, 
                label = "Retiro \n1")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-02-01")), y = 35000, 
                label = "Retiro \n2")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-06-28")), y = 30000, 
                label = "Retiro \n3")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-03-18")), y = 30000, 
                label = "Pandemia"))


