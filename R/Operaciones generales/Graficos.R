mi_df <- data.frame(
  "entero" = 1:4, 
  "factor" = c("a", "b", "c", "d"), 
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

mi_df

#dimensiones
dim(mi_df)

# El largo de un data frame es igual a su número de columnas
length(mi_df)
#names() nos permite ver los nombres de las columnas
names(mi_df)
# La clase de un data frame es data.frame
class(data.frame) 
#data frames you can have different data types within columns, so the difference is that matrix 
#store homogeneous data types whereas data frames store heterogeneous data types.
matriz <- matrix(1:12, ncol = 4)
df <- as.data.frame(matriz)
df

#podremos realizar operaciones, pero r no lo realizará en valores como factor o cadena
mi_df <- data.frame(
  "entero" = 1:4, 
  "factor" = c("a", "b", "c", "d"), 
  "numero" = c(1.2, 3.4, 4.5, 5.6),
  "cadena" = as.character(c("a", "b", "c", "d"))
)

mi_df * 2

#No utilizaremos funciones basicas como for o while, usaremos $ para sustituir for