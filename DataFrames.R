Nombres = c('Juan','Maria')
Edades = c(15,14)
Estado = c(TRUE,FALSE)

#agrupamos

x = cbind(Nombres,Edades,Estado) #cada dato se transforma en una cadena de texto

df = data.frame(Nombres,Edades,Estado) #el tipo de dato no es afectado, cada columna tiene un tipo de dato diferente

summary(df) #hace el analisis para cada columna, segun el tipo de dato que es

####################3 ACCEDIENDO A DATOS ##############################
data() #accedemos a todos los datos que tiene R

y = infert
y$age #accedemos a los valores por el nombre de la columna
y[,2] #accedemos a los valores de la columna 2

datos = y[1:5,1:3] #elegimos ciertos rangos de filas y columnas

y[,c('parity','case')] #selecciona solo las columnas parity y case

case = y$case #una opcion
attach(y) #podemos llamar cada columna solo con el nombre
case
age
detach(y)

## AGREGAR FOLAS Y COLUMNAS ##
## 1 libra = 0.454 kg
## 1 pulgada = 0.0254 m

head(women) #el peso esta en libras y la altura en pulgadas
#vamos a convertir las unidades
w= women
altura_m = w$height * 0.0254 
peso_kg = w$weight * 0.454

#queremos agregar estas dos columnas a w
w = cbind(w,altura_m,peso_kg)
#agregamos filas
fila = c(34,56,123,57)
w = rbind(w,fila) #se agrega la fila en el final
#quitamos una fila
w = w[-c(16),] #elimina la fila 16

## IMC peso/altura^2
imc = w$peso_kg / w$altura_m^2

w = cbind(w,imc)
w = w[,-c(1,2)] #eliminamos las columnas 1 y 2

## ORDENANDO Y FILTRANDO DATOS ##
head(iris)
I = iris[,c(1,2)]

#queremos ordenar los datos
i = order(I$Sepal.Length) #queremos ordenar c/r al ancho
I2 = I[i,] 

#como se repiten valores queremos que en la segunda columna tambien esten ordenados
ii = order(I$Sepal.Length,I$Sepal.Width) #primera prioridad, segunda prioridad de ordenacion
I3 = I[ii,]

#para ordenar de forma descendente
iii = order(-I$Sepal.Length)
I4= I[iii,]

iiii= order(I$Sepal.Length,-I$Sepal.Width)
I5= I[iiii,]

## Seleccionando datos de un data.frame
subset(w,peso_kg > 60 & peso_kg < 70) #subcomjunto que cumple con la condicion
subset(w,peso_kg > 60 & altura_m < 1.70) 

subset(w,peso_kg > 60 & peso_kg < 70, select = c('altura_m','imc'))
