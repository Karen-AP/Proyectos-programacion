#1.Solicite un número n y luego n números al usuario (usando readline). Luego imprima el mayor que número ingreso el usuario.
#2.Solicite un número n y calcule el n-ésimo término de la siguiente suceción fibonacci.
#3. Solicite al usuario 2 números a y b, e imprima una suceción 
menu <- as.numeric( readline( "Ingrese un número entre el 1 y el 3: " ))
#Solicite un número n y luego n números al usuario (usando readline). Luego imprima el mayor que número ingreso el usuario.
if(menu==1){
  numeros <- function(n){
    n <- as.numeric( readline( "Ingrese la cantidad de números en la lista: " ))
    lista <- c()
    for (i in 1:n) {
      x <- as.numeric( readline( "Ingrese un número: " ))
      lista <- c(x,lista)
    }
    print(max(lista))
  }
  numeros()
}

#2.Solicite un número n y calcule el n-ésimo término de la siguiente suceción. 
if(menu == 2){
  
  n <- as.numeric( readline( "Ingrese un número n: " ))
  
  sucesion <- function(){
    if (n == 0) {
      return(1)
    } else if (n == 1) {
      return(1)
    } else {
      i=2
      a <- 1
      b <- 1
      while(i <= n){
        c=( a + b)
        a=b
        b=c
        i <- i+1
      }
    }
    print(paste("El",n,"-esimo termino de la suceción es igual a",c))
  }
  sucesion()
}

#3. Solicite al usuario 2 números a y b, e imprima una suceción 
if(menu==3){
  a <- as.integer(readline("Ingrese un número a: "))
  b <- as.integer(readline("Ingrese un número b: "))
  
  for(i in a:b) {
    for(j in b:i) {
      print(c(i,j))
    }
  }
}
