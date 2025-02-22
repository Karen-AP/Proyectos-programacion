es_primo <- function(n) {
  
  if (n <= 1) {
    return(FALSE)
  }
  if (n == 2) {
    return(TRUE)
  }
  
  for (i in 2:(n-1)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

lista_primos <- function() {
  a <- as.integer(readline("Introduce el número a: "))
  b <- as.integer(readline("Introduce el número b: "))
  
  if (a > b) {
    temp <- a
    a <- b
    b <- temp
  }
  
  for (i in a:b) {
    if (es_primo(i)) {
      print(i)
    }
  }
}

lista_primos()