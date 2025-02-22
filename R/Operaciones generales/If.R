#Solución ecuación cuadrática
a<- as.numeric( readline( "Digite un número decimal:" ))
b<- as.numeric( readline( "Digite un número decimal:" ))
c<- as.numeric( readline( "Digite un número decimal:" ))
s=print( b**2- 4*a*c )
if(s > 0){
  print('Tiene dos soluciones')
}if(s < 0){
  print('No tiene una solución')
}if(s == 0){
  print('Tiene una solución')
}

a <- as.numeric(readline( "introduce el coeficiente a: "))
b <- as.numeric(readline( "introduce el coeficiente b: "))
c <- as.numeric(readline( "introduce el coeficiente c: "))

#indique si tiene o no soluciones
disc= b*b - 4*a*c

if( disc < 0 ){
  print( "No tiene solución ")
}
if( disc== 0){
  print( "Tiene solución" ) 
}
if( disc > 0){
  print( "Tiene dos soluciones" )
}


#solicite al usuario 3 numeros y muestrelos ordenados de mayor a menor
a <- as.numeric( readline("introduce  a: "))
b <- as.numeric( readline("introduce  b: "))
c <- as.numeric( readline("introduce  c: "))

if (a > b && b > c){
  print(paste(a,b,c))
}
if( a > b $ c>b){
  print(paste(a,c,b))
}
if( b > a $ a > c){
  print(paste(b,a,c))
}
