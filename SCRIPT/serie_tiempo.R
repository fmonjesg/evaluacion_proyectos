#Librerias
library(tidyverse)
library(readxl)
library(tseries)
library(forecast)
library(ggfortify)
#Carga de datos
serie <- read_excel("C:/Users/Notebook/Desktop/serie_tiempo.xlsx", 
                    col_types = c("numeric", "text", "numeric",
                                  "numeric", "numeric", "date"))
# Escalar y Análisis Previo

serie <- serie %>% 
  mutate(demanda = demanda*1.5)


serie %>% 
  ggplot() + 
  geom_line(aes(x = fecha, y = demanda), color = "blue") +
  labs(title = "Evolución Demanda",
       x = "Periodo",
       y = "Demanda")

serie %>% 
  select(periodo, temporada, demanda) %>% 
  spread(key = temporada, value = demanda)

## Serie de Tiempo

serie2ts <- ts(serie$demanda, start = c(2012,1), end = c(2022, 4), frequency = 4)

print(serie2ts)

serie2ts %>% 
  autoplot(ts.colour = "blue")


autoplot(stl(serie2ts, s.window = "periodic"), ts.colour = "blue")



arima6<- Arima(serie2ts, order=c(0,1,1), seasonal=list(order=c(0,1,1),period=12))

forecast1<-forecast(arima6, level = c(95), h = 20)
autoplot(forecast1)
