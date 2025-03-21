#Borro todos los datos almacenados
rm(list = ls())
graphics.off()

#Vector de períodos
Periodo <- c(1:4)

#Vector de precios
Precio <- c(945 , 890, 835, 785)

#Calcular los factores de descuento
DiscFact <- Precio / 1000

#toString() convierte el vector en una lista separada por comas
paste("Los factores de descuento son", toString(round(DiscFact, 4)))

#Calcular tasa spot
Spot <- c((1000/Precio)^(1/Periodo)-1)

#toString() convierte el vector en una lista separada por comas
paste("Las tasas spot son:", toString(round(Spot, 4)))


# Calcular la tasa par para 4 años
# La tasa para es aquella que hace que los flujos de fondos descontados a esa tasa sean igual a 1.000
TasaPar4 <- (1 - DiscFact[4]) / sum(DiscFact[1:4])

paste("La tasa par a 4 años es:", TasaPar4)

#Calcular TEA fwd
#Notar que el primer elemento es la tasa spot

TEAfwd <- numeric(4)  # Iniciar un vector de 4 elementos

# El primer elemento es la tasa spot
TEAfwd[1] <- Spot[1]

# Loop para calcular los últimos 3 datos
for (i in 2:4) {
  TEAfwd[i] <- (1 / Precio[i]) / (1 / Precio[i - 1]) - 1
}

paste("Las tasas spot son:", toString(round(TEAfwd, 4)))

#Extra. Calcular TNA continua
TNAcont <- c(log(1000/Precio))/Periodo

#Extra.TEA continua es ln(TEA fwd + 1)
TEAcontfw <- log(TEAfwd+1)
print(TEAcontfw)

#Extra. Crear dataframe con los datos.

# Crear DataFrame consolidado
df <- data.frame(
  Periodo = Periodo,
  FactorDescuento = round(DiscFact, 6),
  TasaSpot = round(Spot, 6),
  TEAfwd = round(TEAfwd, 6),
  TNA_Cont = round(TNAcont, 6),
  TEA_Cont = round(TEAcontfw, 6)
)
