#Necesitaremos los siguientes paquetes
## dplyr
## tidyr
## readxl
library(readxl)
install.packages("dplyr")
install.packages("tidyr")
library(tidyr)
library(dplyr)

c1 = read_excel(path = "Calificaciones1.xlsx",sheet = "Sheet1")
c2 = read_excel(path = "Calificaciones2.xlsx",sheet = "Sheet1")
#tienen en comun la columna id

#uniendo bases de datos
c = merge(c1,c2,by = "id", all = TRUE)
#R junta las bases de datos de manera adecuada

dim(c) # 20 5 

glimpse(c) #nos muestra la base de datos en filas

c = tbl_df(c) #se obtiene informacion un poco más completa
head(c)

###### USANDO dplyr
select(c,id,Fisica,Filosofia)
select(c,-Matematica) #selecciona todas las columnas menos la de matematica

#filtramos datos
filter(c,Matematica>5)

filter(c,Filosofia>Literatura & Filosofia > 7)

#queremos eliminar las filas con NA
sinNA= filter(c,!is.na(Matematica))



CN = filter(c,!is.na(Matematica))
#crear nuevas columnas a partir de las columnas existentes
comparacion = mutate(CN,numeros = (Matematica+Fisica)/2,letras = (Filosofia+Literatura)/2) #gneera una nueva columna con el promedio
comp1 = mutate(comparacion, comparacion = ifelse(numeros>letras,"N","L"))
#lo que hicimos fue agregar una columna de N y L segun la condicion

comp2 = arrange(comp1,desc(comparacion)) #se ordenan las columnas

## operador %>%
data_final = c %>% filter(!is.na(Matematica)) %>% 
  mutate(numeros = (Matematica+Fisica)/2,letras = (Filosofia+Literatura)/2) %>%
  mutate(comparacion = ifelse(numeros>letras,"N","L")) %>%
  arrange(id) %>% 
  select(id,numeros,letras,comparacion)

data_final

## UDO DE TIDYR
#gather()

s = tbl_df(read_excel(path = "Secciones.xlsx",sheet = "Sheet1"))

s = tbl_df(transform(s,Seccion = as.factor(Seccion)))

s1 = gather(s,sexo,numero,Hombre,Mujer) %>% #nos transforma nustro dataframe
  transform(sexo=as.factor(sexo)) #transformamos a factor la columna de sexo
s1
        
s1 = tbl_df(s1)    

## proceso inverso
# spread()
s_old = spread(s1,sexo,numero) #s_old es igual a s

#separate()
m = as_tibble(read_excel(path = "Secciones.xlsx",sheet = "Sheet2"))

M1 = separate(m,Materia_nivel,c("Materia","Nivel"),sep = "_") #R igual infiere el separador

# unite()
m_old = unite(M1,materia_nivel,Materia,Nivel,sep = "-")
#juntamos dos columnas con el -
