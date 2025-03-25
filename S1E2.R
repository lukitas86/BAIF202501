#Borro todos los datos almacenados
rm(list = ls())
graphics.off()

#Vector de períodos
Periodo <- c(1:4)

#Vector de flujos
Flujos <- c(rep(70,3), 1070)

#Vector de descuentos
FD <- c(.945 , .890, .835, .785)

#Calcular Valor Presente de cada flujo de fondos
VP <- Flujos * FD
                            
#Precio es la suma de los VP
Precio <- sum(VP)

#Rta A
paste ("El precio del bono es:", Precio)

#Duration se calcula como la suma del (número de periódo por el VP) divido por el precio
Auxduration <- sum(Periodo *  VP)

Duration <- Auxduration/Precio

#Rta B
paste ("La duration del bono es:", round(Duration,2))

#Calcular nuevo precio
PrecioNuevo <- Precio - (Precio * Duration / 100)

#Rta C
paste ("El precio del bono ante un aumento de 100 bps es:", PrecioNuevo)







