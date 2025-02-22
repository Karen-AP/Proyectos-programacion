#Diferentes funciones if que se escogen a partir de un menú
#Solicite al usuario un número entre 1 y 4 y  dependiendo del número escogido realice:
num_menu <- as.numeric( readline( "Digite un número entre 1 y 4
                                  (1: solución ecuación cuadrática,2:Prueba si es triángulo,
                                  3: Año bisisiesto y 4:hora un segundo después):" ))

#Solicita 3 números con decimales a, b y c(numeric)y calcula las soluciones(o solución)
#de la ecuación a*x 2 + b*x + c, indicar si tiene o no solución 
if (  num_menu == 1 ) {
  a <- as.numeric( readline( "Digite un número decimal:" ))
  b <- as.numeric( readline( "Digite un número decimal:" ))
  c <- as.numeric( readline( "Digite un número decimal:" ))
  
  s <- print( b**2 - 4*a*c )  
  if(s > 0){
    print('Tiene dos soluciones')
  } 
  if(s < 0){
    print('No tiene una solución')
  } else {
    print('Tiene una solución')
  }
}

# Triangulo solicita 3 números con decimales e imprime “Si es triángulo” o “No es triángulo”
if (  num_menu == 2 ) {
  a <- as.numeric( readline( "Digite un número decimal:" ))
  b <- as.numeric( readline( "Digite un número decimal:" ))
  c <- as.numeric( readline( "Digite un número decimal:" ))
  
  if( a+b > c && a+c >b && b+c> a ){
    print("Es triangular")
  }else{
    print("No triangular")
  }
}

#Solicita un año e indica si el mismo es bisiesto o no
if (  num_menu == 3 ) {
  
  año <- as.numeric( readline( "Digite un año:" ))
  
  if (año %% 4 == 0 && año %% 100 != 0 || año %% 400 == 0) {
    print( paste( año, "Es año bisiesto") )
  } else {
    print( paste( año, "No es año bisiesto"))
  }
}

#Solicita una hora, minutos, segundos y diga la hora que es un segundo después
if (  num_menu == 4 ) {
  
  hora    <- as.numeric( readline( "Digite la hora:" ))
  minutos <- as.numeric( readline( "Digite los minutos:" ))
  segundos<- as.numeric( readline( "Digite los segundos:" ))
  
  segundos <- segundos + 1
  
  if (segundos >= 60) {
    segundos <- 0
    minutos <- minutos + 1
    if (minutos >= 60) {
      minutos <- 0 
      hora <- hora + 1
    }
  }
  if (hora <= 12) {
    print(paste("La hora es", hora ,":", minutos ,":", segundos ) )
  } else if (hora > 12) {
    hora12 <- hora - 12
    print(paste("La hora es", hora12 ,":", minutos ,":", segundos ))
  }
}
