# Librerias
library(tidyverse)
library(lubridate)
library(readxl)
library(ggthemes)

# Datos

ipc <- read_excel("C:/Users/Notebook/Desktop/ipc.xlsx", 
                  col_types = c("numeric", "numeric", "numeric", 
                                "date", "numeric", "numeric", "numeric"))

# Gráfico


ipc %>% 
  ggplot(aes(x = fecha, y = `Variación Mensual ( % )`)) +
  geom_line(color = "red", size = 1.25) + 
  labs(title = "Evolución IPC",
       subtitle = "Enero 2010 - Agosto 2022",
       caption = "Fuente: Elaboración Propia en base a INE") +
  theme_economist()



ipc %>% 
  filter(fecha > "2019-12-01") %>% 
  ggplot(aes(x = fecha, y = `Variación Mensual ( % )`)) +
  geom_line(color = "red", size = 1.25) +
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
  geom_text(aes(x = as.POSIXct(as.Date("2020-01-01")), y = 1, 
                label = "Estallido \nSocial")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-09-09")), y = 1, 
                label = "Retiro \n1")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-02-01")), y = 1, 
                label = "Retiro \n2")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-06-28")), y = 1, 
                label = "Retiro \n3")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-03-18")), y = 1, 
                label = "Pandemia")) + 
  labs(title = "Evolución IPC",
       subtitle = "Enero 2020 - Agosto 2022",
       caption = "Fuente: Elaboración Propia en base a INE") +
  theme_economist()

  

ipc %>% 
  filter(fecha > "2019-12-01") %>% 
  ggplot(aes(x = fecha, y = `Variación 12 Meses ( % )`)) +
  geom_line(color = "red", size = 1.25) +
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
  geom_text(aes(x = as.POSIXct(as.Date("2020-01-20")), y = 5, 
                label = "Estallido \nSocial")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-09-09")), y = 5, 
                label = "Retiro \n1")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-02-01")), y = 5, 
                label = "Retiro \n2")) +
  geom_text(aes(x = as.POSIXct(as.Date("2021-06-01")), y = 5, 
                label = "Retiro \n3")) +
  geom_text(aes(x = as.POSIXct(as.Date("2020-04-30")), y = 5, 
                label = "Pandemia")) + 
  labs(title = "Variación IPC 12 Meses",
       subtitle = "Enero 2020 - Agosto 2022",
       caption = "Fuente: Elaboración Propia en base a INE") +
  theme_economist()

