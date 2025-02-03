#Función para el cálculo de las funciones cuadrática, además gráfico de las respuestas y función
library(ggplot2)

CalcularRaicesQuad <- function(a, b, c, x1, x2, opcion) {
  # Calculo de raíces
  discriminante <- b^2 - 4*a*c
  if (discriminante >= 0) {
    roots <- c((-b + sqrt(discriminante)) / (2*a), (-b - sqrt(discriminante)) / (2*a))
  } else {
    roots <- print("No se puede obtener un resultado")
  }
  
  # Crear datos para el gráfico
  x_vals <- seq(x1, x2, length.out = 400)
  y_vals <- a * x_vals^2 + b * x_vals + c
  df <- data.frame(x = x_vals, y = y_vals)
  
  # Preparar el gráfico
  p <- ggplot(df, aes(x=x,y= y)) +
    geom_line(color = "blue") +
    geom_point(data = data.frame(x = roots, y = rep(0, length(roots))), 
               aes(x = x, y = y), color = "green", size = 3) +
    labs(title = "Gráfico de la función cuadrática", x = "x", y = "f(x)") +
    theme_minimal()
  
  print(p)
  
  return(paste("El resultado del cálculo de las raíces es:",roots))
}

# Ejemplo de uso
CalcularRaicesQuad(1,-3,2,-1,4,1)