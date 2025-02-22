#Primer parte:Consulta de faltantes en base 2 que se encuentran en base 1(revisión de trabajo manual de copa de bases), 
#Segunda parte: Combinación de bases de acuerdo con contenido igual en las columnas de asignatura y código, compilando las columnas "2025-1", "2025-2", "2025-3"
#             Resultado: base con una columna de asignatura y código repite "2025-1", "2025-2", "2025-3" por base
#install.packages("readxl")
#install.packages("dplyr")
#install.packages("tidyr")
library(tidyr)
library(readxl)
library(dplyr)
library(readxl)
Planificación_2025 <- read_excel("OneDrive/Documentos/Planificación 2025.xlsx")
Copia_de_Revisión_Planificación_anual_de_asignaturas_grado_2024_IGESCA_marzo_rev_mrojasssss <- read_excel("OneDrive/Documentos/Copia de Revisión Planificación anual de asignaturas grado_ 2024 IGESCA marzo rev_mrojasssss.xlsx")
base1= read_excel("Dirección Documento.xlsx")
base2= read_excel("Dirección Documento.xlsx")


# Filtrar las filas de base1 cuyos valores de "Columna1" y "Columna2" no estén en base2
faltantes_base1 <- base1[!(base1$Columna1 %in% base2$Columna1 & base1$Columna2 %in% base2$Columna2), c("Columna1", "Columna2")]

# Mostrar las filas faltantes
print(faltantes_base1)

#####################
combinar_bases <- function(base1, base2) {
  # Columnas clave para la unión
  claves <- c( "Código", "ASIGNATURA")
  
  # Verificar que las columnas clave existen en ambas bases
  if (!all(claves %in% names(base1)) | !all(claves %in% names(base2))) {
    stop("Las columnas clave no están presentes en ambas bases.")
  }
  
  # Seleccionar las columnas 2025 de base1
  cols_2025_base1 <- c("2025-1", "2025-2", "2025-3")
  # Seleccionar las columnas 2025 de base2 (asegurándonos de que existan)
  cols_2025_base2 <- intersect(c("2025-1", "2025-2", "2025-3"), names(base2))
  
  # Asegurarnos de que las columnas 2025 existen en ambas bases
  if (length(cols_2025_base1) == 0 | length(cols_2025_base2) == 0) {
    stop("No se encontraron columnas para el año 2025 en una de las bases.")
  }
  
  # Unir las bases por las columnas clave y las columnas de 2025
  combinada <- merge(
    base1[, c(claves, cols_2025_base1), drop = FALSE],
    base2[, c(claves, cols_2025_base2), drop = FALSE],
    by = claves,
    all = TRUE,  # Mantener todas las filas
    suffixes = c("_base1", "_base2")
  )
  
  # Cambiar los nombres de las columnas para hacer referencia a los sufijos correctamente
  # Asegurarnos de que accedemos a las columnas 2025 correctamente con los sufijos
  cols_2025_base1_suffixed <- paste(cols_2025_base1, "_base1", sep = "")
  cols_2025_base2_suffixed <- paste(cols_2025_base2, "_base2", sep = "")
  
  # Identificar filas no emparejadas en base2
  no_emparejados <- combinada[is.na(rowSums(!is.na(combinada[, c(cols_2025_base1_suffixed, cols_2025_base2_suffixed)]))), ]
  
  list(combinada = combinada, no_emparejados = no_emparejados)
}

# Ejemplo de uso:
# base1 y base2 son tus dataframes
resultado <- combinar_bases(base1, base2)

# Base combinada
base_combinada <- resultado$combinada
print("Base combinada:")
print(base_combinada)

# Filas no emparejadas
base_no_emparejados <- resultado$no_emparejados
print("Base no emparejados:")
print(base_no_emparejados)

