##Librerias
library(tidyverse)
library(readxl)
library(xtable)

## Datos

reg <- read_excel("C:/Users/Notebook/Desktop/regresion.xlsx")


## Gráficos

reg %>% 
  ggplot(aes(x = x1, y = y)) +
  geom_point(color = "blue", size = 2.5) + 
  labs(title = "Gráfico de Dispersión")


## Regresión

reg1 <- lm(y ~ x1, data = reg)
summary(reg1)

reg %>% 
  ggplot(aes(x = x1, y = y)) +
  geom_point(color = "blue", size = 2.5) + 
  labs(title = "Gráfico de Dispersión") + 
  geom_smooth(method = "lm", se = FALSE, color = "red")


reg2 <- lm(y ~ x1 + x2 + x3, data = reg)
summary(reg2)


print(xtable(reg1))
print(xtable(reg2))
