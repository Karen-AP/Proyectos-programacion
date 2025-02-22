#reciba dos números a y b;  y retorne un vector con todos los números primos entre a y b. Incluido a y b
es_primo <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  
  return(TRUE)
}

vector_primos <- function(a, b) {
  if (a > b) {
    temp <- a
    a <- b
    b <- temp
  }
  
  primos <- c()
  
  if (a <= 2 && b >= 2) {
    primos <- c(primos, 2)
  }
  
  for (i in a:b) {
    if (es_primo(i)) {
      primos <- c(primos, i)
    }
  }
  
  return(primos)
}

# Ejemplo
vector_primos(a = 8, b = 2)


