### Caso Confitería

## Librerías

library(tidyverse)
library(chilemapas)
library(flextable)
library(leaflet)
library(readxl)
library(xtable)

## Datos 

localizacion <- read_excel("Desktop/Dulces_para_Todos.xlsx", sheet = "Localización")

## Análisis

# Distribución Población por Edad

censo_2017_comunas %>% 
  filter(codigo_comuna == 13113) %>% 
  group_by(edad) %>% 
  summarise(sum(poblacion)) %>% 
  flextable()

print(
  xtable(censo_2017_comunas %>% 
           filter(codigo_comuna == 13113) %>% 
           group_by(edad) %>% 
           summarise(sum(poblacion)), type = "latex")
)


censo_2017_comunas %>% 
  filter(codigo_comuna == 13113) %>% 
  group_by(edad) %>% 
  summarise(sum(poblacion)) %>% 
  flextable()

# Localización

leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(data = localizacion, 
                   lat = ~Latitud,
                   lng = ~Longitud,
                   popup = ~Ubicación) %>% 
  popupOptions(keepInView = TRUE)

