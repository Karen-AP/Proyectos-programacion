# busca calcular que día del año se encuentra el día digitado por el usuario y cuantos faltan para que se acabe dicho año
# tomando en cuenta los años bisiestos
# Definir número de días en los meses (considerando años bisiestos después)
dias_por_mes <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
meses <- c("enero", "febrero", "marzo", "abril", "mayo", "junio",
           "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre")

# Entrada de datos
s <- readline("Digite el día de la semana: ")
dia <- as.numeric(readline("Digite el número del día: "))
m_input <- readline("Digite el mes (en número o palabra): ")
año <- as.numeric(readline("Digite el año: "))

# Convertir el mes a número si se ingresó en palabras
if (m_input %in% meses) {
  m <- match(m_input, meses)  # Obtener el índice del mes
} else {
  m <- as.numeric(m_input)  # Convertir si es número
}

# Validar el mes
if (is.na(m) || m < 1 || m > 12) {
  stop("Mes inválido. Debe ser un número entre 1 y 12 o un nombre válido.")
}

# Verificar si el año es bisiesto
es_bisiesto <- (año %% 4 == 0 & año %% 100 != 0) | (año %% 400 == 0)
if (es_bisiesto) {
  dias_por_mes[2] <- 29  # Febrero tiene 29 días en un año bisiesto
}

# Validar que el día sea correcto para el mes ingresado
if (dia < 1 || dia > dias_por_mes[m]) {
  stop("Día inválido para el mes seleccionado.")
}

# Calcular el número del día en el año
p <- sum(dias_por_mes[1:(m-1)]) + dia  # Suma de días de los meses anteriores más el día actual

# Días restantes en el año
dias_totales <- ifelse(es_bisiesto, 366, 365)
f <- dias_totales - p

# Mostrar el resultado
cat(sprintf("El %s %d de %s del %d es el día %d del año y faltan %d días para que acabe el año.\n", 
            s, dia, meses[m], año, p, f))
