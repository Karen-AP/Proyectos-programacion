# Menú que calcula los siguientes resultados:
#1:Producto de Wallis para calcular pi. Debe solicitar un número n y multiplicar los n términos,
#al final multiplicar el resulta por 2, el resultado deberá aproximarse al valor de PI entre más grande sea el n.
# sucesión de multiplicaciones, resultado final multiplicar por dos
#2: Solicite un número n e imprime si el número es primo o no es primo
#3:Solicita dos numeros y verifica si estos son primos

menu <- as.numeric( readline( "Digite un número entre 1 y 3:" ))

# 1. Producto de Wallis
if (  menu == 1 ) {
  num <- as.numeric( readline( "Digite un numero:"))
  x <- 1
  n <- 1
  while(n <= num){
    x <- x * ((4 * n^2) / (4 * n^2 - 1))
    n <-  n+1
  }
  x <- x*2
  print(x)
}

#2. Solicite un número n e imprime si el número es primo o no es primo
if (  menu == 2 ) {
  x <- as.numeric( readline( "Ingrese un número: " ))
  primo <- TRUE
  if( x >= 2){
    i <- 2
    while( i <= sqrt(x) && primo ){
      if( x %% i == 0 ){
        primo <- FALSE
      }
      i = i + 1
    }
  } 
  if( primo ) {
    print( "Primo" )
  } else {
    print( "Es compuesto" )
  }
}

#3.Solicite 2 números a y b  e imprime todos los  números primos entre a y b incluidos
if (  menu == 3 ) {
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
}