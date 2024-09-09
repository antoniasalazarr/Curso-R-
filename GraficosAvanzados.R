# tidyverse
# ggplot2

library(tidyverse)
i = iris

ggplot(data = i) + #crea un lienzo en blanco y se grafica con capas
  geom_point(aes(x=Petal.Length,y=Petal.Width,col= Species))

#ggplot(data = i) + #crea un lienzo en blanco y se grafica con capas
 # geom_point(aes(x=Petal.Length,y=Petal.Width,shape= Species)) #las especies se distinguen por la forma

ggplot(data = i) + #crea un lienzo en blanco y se grafica con capas
  geom_point(aes(x=Petal.Length,y=Petal.Width,col = Species),
                 #col = "red",
                 size = 3,
                 alpha = 1/5)

## Transformaciones estadisticas

ggplot(data = i) + #crea un lienzo en blanco y se grafica con capas
  geom_point(aes(x=Petal.Length,y=Petal.Width,col = Species),
             #col = "red",
             size = 3,
             alpha = 1/5) +
  geom_smooth(aes(x=Petal.Length,y=Petal.Width,linetype = Species),
              method = "lm", #ajuste lineal
              se = FALSE, #elimina la sombra al rededor de la linea
              col="darkgreen")

###### Graficos condicionados #######

ggplot(data = i) +
  geom_point(aes(x=Petal.Length,y=Petal.Width,col = Species),
             #col = "red",
             size = 3,
             alpha = 1/5) +
  geom_smooth(aes(x=Petal.Length,y=Petal.Width,linetype = Species),
              method = "lm", #ajuste lineal
              se = FALSE, #elimina la sombra al rededor de la linea
              col="darkgreen") + 
  facet_wrap( ~ Species,nrow = 3) #se separan los graficos en 3 columnas


ggplot(data = i) +
  geom_point(aes(x=Petal.Length,y=Petal.Width,col = Species),
             #col = "red",
             size = 3,
             alpha = 1/5) +
  geom_smooth(aes(x=Petal.Length,y=Petal.Width),
              method = "lm", #ajuste lineal
              se = FALSE, #elimina la sombra al rededor de la linea
              col="darkgreen") +
  labs(title = "Gráfica de prueba",
       x= 'Longitud',
       y= 'Ancho') +
  theme_minimal(base_family = "mono") #cambiamos el estilo del gráfico
