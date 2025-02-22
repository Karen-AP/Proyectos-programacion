#reciba dos números a y b; y retorne un vector con todos los números compuestos incluidos a y b.  
es_compuesto <- function(n) {
  if (n <= 3) {
    return(FALSE)
  }
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(TRUE)
    }
  }
  
  return(FALSE)
}

vector_comp <- function(a, b) {
  if (a > b) {
    temp <- a
    a <- b
    b <- temp
  }
  
  comp <- c()
  for (i in a:b) {
    if (es_compuesto(i)) {
      comp <- c(comp, i)
    }
  }
  return(comp)
}
#Ejemplo
vector_comp (a = 1, b = 30)