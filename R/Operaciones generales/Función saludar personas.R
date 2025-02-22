saludar <- function(){
  print("Hola")
}
saludar()


saludar.persona<- function(nombre){
  print(paste("Hola", nombre))
}
saludar.persona("Pedro")

saludar.todos<- function(v.todos){
  for (pers in v.todos) {
    print(paste("Hola", pers))
  }
}
saludar.todos ( c("Ana","Jose","Pedro") )