#reciba un número a y retorne un logical si el número es primo True o no es primo False. 
es_primo <- function(a) {
  primo <- TRUE
  if (a <= 1) {
    return(FALSE)
  } else {
    i <- 2
    while (i <= sqrt(a) && primo) {
      if (a %% i == 0) {
        primo <- FALSE
      }
      i <- i + 1
    }
  }
  return(primo)
}

# Ejemplo:
es_primo(a = 1)
  

