
#saber si podría ser un triangulo

a <- as.numeric(readline( "introduce el coeficiente a: "))
b <- as.numeric(readline( "introduce el coeficiente b: "))
c <- as.numeric(readline( "introduce el coeficiente c: "))

if( a + b > c && a + c > b && b + c > a){
  print("Triangulo")
}else{
  print("No triangulo")
}
}

#solicite un número al usuario e indique si es par o no
a <- as.numeric( readline( "Digite a:"))

if( a %/% 2 == 0){
  print("par")
}else{
  print("Impar")
}