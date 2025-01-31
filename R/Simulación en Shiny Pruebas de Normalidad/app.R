library(shiny); library(ggplot2); library(plotly); library(tseries); library(reshape2)
# Interfaz
ui <- fluidPage(
  titlePanel("Análisis de Pruebas de Normalidad bajo Heterocedasticidad"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("mu", "Medias (mu):", value = "98,86,14,29"),
      textInput("v", "Varianzas (v):", value = "98,86,14,29"),
      sliderInput("r", "Número de réplicas:", min = 2, max = 80, value = 50),
      actionButton("run", "Correr Simulación")
    ),
    
    mainPanel(
      uiOutput("title"),
      tableOutput("results"),
      plotlyOutput("plot")
    )
  )
)

# Servidor
server <- function(input, output) {
  sh <- function (r1, mu, v) {
    k <- length(mu)
    n <- r1 * k
    y <- rnorm(n = n, mean = rep(mu, each = r1), sd = sqrt(rep(v, each = r1)) + 1e-6)  # Asegurar variabilidad
    factor.a <- factor(rep(1:k, each = r1))
    factor.b <- factor(rep(c("A", "B"), length.out = n))
    
    mod <- lm(y ~ factor.a * factor.b)
    
    # Evitar error de valores idénticos en Shapiro
    res <- residuals(mod)
    if (length(unique(res)) == 1) return(NA)  # Devolver NA si los residuos son constantes
    
    p <- shapiro.test(res + rnorm(length(res), 0, 1e-6))$p.value  # Agregar ruido
    return(p)
  }
  
  
  kol <- function (r1, mu, v) {
    k <- length(mu)
    n <- r1 * k
    y <- rnorm(n = n, mean = rep(mu, each = r1), sd = sqrt(rep(v, each = r1)))
    factor.a <- factor(rep(1:k, each = r1))
    factor.b <- factor(rep(c("A", "B"), length.out = n))
    mod <- lm(y ~ factor.a * factor.b)
    p <- ks.test(residuals(mod) + rnorm(length(residuals(mod)), 0, 1e-6),  # Corregido
                 "pnorm",
                 mean = mean(residuals(mod)),
                 sd = sd(residuals(mod)))$p.value
    return(p)
  }
  
  jb <- function (r1, mu, v) {
    k <- length(mu)
    n <- r1 * k
    y <- rnorm(n = n, mean = rep(mu, each = r1), sd = sqrt(rep(v, each = r1)))
    factor.a <- factor(rep(1:k, each = r1))
    factor.b <- factor(rep(c("A", "B"), length.out = n))
    mod <- lm(y ~ factor.a * factor.b)
    p <- jarque.bera.test(residuals(mod))$p.value
    return(p)
  }
  
  observeEvent(input$run, {
    mu <- as.numeric(unlist(strsplit(input$mu, ",")))
    v <- as.numeric(unlist(strsplit(input$v, ",")))
    r_values <- seq(2, input$r)
  
  results <- data.frame(Réplicas = integer(), Shapiro = double(), `Jarque Bera` = double(), Kolmogorov = double())
  
  for (r1 in r_values) {
    M <- 1000
    sha <- numeric(M)
    jab <- numeric(M)
    kolv <- numeric(M)
    
    for (j in 1:M) {
      sha[j] <- sh(r1, mu, v)
      jab[j] <- jb(r1, mu, v)
      kolv[j] <- kol(r1, mu, v)
    }
    
    results <- rbind(results, data.frame(
      Réplicas = r1,
      Shapiro = mean(sha < 0.05),
      `Jarque Bera` = mean(jab < 0.05),
      Kolmogorov = mean(kolv < 0.05)
    ))
  }
    output$title <- renderUI({
      h3("Promedio de valor p según prueba por réplica")
    })
    output$results <- renderTable({
      results
    })
    
    output$plot <- renderPlotly({
      tab2 <- melt(results, id.vars = "Réplicas", variable.name = "Pruebas", value.name = "Probabilidad")
      
      g1 <- ggplot(tab2, aes(x = Réplicas, y = Probabilidad, colour = Pruebas)) +
        geom_line() +
        ylab("Probabilidad Error Tipo I") +
        xlab("Número de réplicas") +
        theme_minimal() +
        scale_color_manual(values = c("#000066", "#FF9933", "#FF5733"))
      
      ggplotly(g1)
    })
  })
}

# Correr la app
shinyApp(ui = ui, server = server)


