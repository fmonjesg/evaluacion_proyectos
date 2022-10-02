#Librerias
library(tidyverse)
library(sf)
library(ggrepel)
library(openxlsx)
library(readxl)
library(patchwork)
devtools::install_github("yutannihilation/ggsflabel")
library(ggsflabel)

#Datos

comunas <- read_sf("/Users/felipemonjes/Desktop/carpeta sin título/Comunas/comunas.shp")

# Mapa Simple

comunas13 <- comunas %>% 
  select(geometry, codregion, comuna) %>% 
  filter(codregion == 13)




# Unión Bases

resultados <- read_excel("/Users/felipemonjes/Desktop/carpeta sin título/resultados.xlsx")

comunas <- comunas %>% 
  left_join(resultados, by = "cod_comuna")


comunas13 %>% 
  select(geometry, codregion) %>% 
  filter(codregion == 13) %>% 
  ggplot() + 
  geom_sf() +
  labs(title = "Sector Factible de Instalación") + 
  geom_sf_label_repel(data = comunas13, aes(label = comuna))



comunas %>% 
  filter(codregion == 13) %>%  
  ggplot() + 
  geom_sf(aes(fill = estado)) +
  labs(fill = "Factibilidad", title = "Sector Factible de Instalación",
       x = "", y = "") + 
  geom_sf_label_repel(data = comunas13, aes(label = comuna))
