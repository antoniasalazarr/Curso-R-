## GRAFICOS EN R
x = c(1,2,3,5)
y = c(4,5,2,3)

plot(x,y,col='red',main='Mi Primer Gráfico',xlab = "Eje X",ylab = "Eje Y")
z = as.factor(c('si' , 'no' , 'si' , 'si','no','si')) #el si y el no se vuelven caracteristicas
plot(z,main = "Gráfico de barras",col="pink") #obtenemos un grafico de barras

#mas personalizacion
grid(lwd=3,col="blue")
par(new=TRUE) #para que la grilla quede abajo del grafico
plot(x,y,
     col='red',
     main='Mi Primer Gráfico', #título
     sub="Mi primer subtítulo", #subtítulo
     xlab = "Eje X", #etiqueta de los ejes
     ylab = "Eje Y", #etiqueta de los ejes
     pch = 16, #simbolo
     type = 'b', #forma en la que se unen los puntos
     lty=4, #cómo se pinta la linea que une los puntos (en el caso que haya linea)
     lwd=3, #grosor de la línea
     xlim = c(1.5,4.5)) #se pintan los puntos que están en este rango


#pch -> forma de los puntos
#1 -> cisculo
#2 -> triangulo
#16 -> punto relleno
#type -> forma en que se unen los puntos
#lty -> cómo se pinta la linea que une los puntos (en el caso que haya linea)
#2 -> linea punteada
#3 -> linea punteada mas delgada
#lwd -> ancho de la linea

## GRAFICANDO FUNCIONES
x = seq(1,3,length=1000) #creamos un vector de 1 a 3 con mil datos
plot(x,x^2,
     lwd= 1,
     type = 'l',
     col='blue')
lines(x,x) #grafica la funcion en el mismo plot de arriba

## R tiene datos por ejemplo
head(iris)
class(iris)

head(trees) #datos de arboles
lapply(iris,class)

plot(iris$Species) #generamos un grafico de barras

elementos = table(iris$Species) #nuevo objeto --> especie de dataframe
barplot(elementos,#lo que queremos graficar debe ser matriz o vector o table
        col="yellow") 

## HISTOGRAMAS
head(trees)
max(trees$Height)
min(trees$Height)
trees$Height #70 65 63 72 81 83 66 75 80 75 79 76 76 69 75 74 85 86 71 64 78 80 74 72 77 81 82 80 80 80 87
class(trees$Height) #numeric

alturas= trees$Height #vector de las alturas de los arboles
hist(alturas,
     prob=TRUE,
     col= 'cyan',
     breaks = 10) #el numero indica las lineas entre el valor inicial y final

## DIAGRAMA DE CAJA Y BIGOTES

boxplot(trees$Volume)
hist(trees$Volume)

## EXPORTANDO GRAFICOS QUE GENERAMOS
head(trees)

png(filename = "gráfico.png",height = 400, width = 700) #todo lo que vaya despues es el gráfico
plot(x= trees$Height, #obtenemos grafico de dispersion
     y= trees$Volume,
     main= "Volumen vs Altura",
     xlab= "Altura",
     ylab= "Volumen",
     col= "blue")
dev.off() #para que sepa que aqui termina el gráfico

#existen otras formas de exportar --> jpg, tiff, etc. (se hace igual que png)








