
head(iris) #contiene caracteristicas de una flor
summary(iris) #da el minimo, 1° cuartil,mediana,media,3°cuartil y el max de cada columna
lapply(iris,class)

iris$Petal.Length
hist(iris$Petal.Length)
hist(iris$Petal.Width)

plot(iris) #al aplicarlo a un dataframe hace gráficos de correlaciones
#podemos ver entre cuales variables existe mayor o menor correlación

plot(x= iris$Petal.Width,
     y= iris$Petal.Length)

#ajuste lineal
modelo = lm(Petal.Length~Petal.Width,data = iris) #ajuste de minimos cuadrados
modelo #muestra un resumen de los coeficientes que definen el modelo
#la variable indepentiente es el ancho
#long= 2.130 * ancho + 1.084

names(modelo)
modelo$fitted.values

summary(modelo)
plot(y=iris$Petal.Length,
     x=iris$Petal.Width,
     col="red")
x = seq(0,3,length=1000)
lines(x,2.230 * x + 1.084,
      col="green")
