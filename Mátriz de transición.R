## Tareita: De los procesos vistos en clase o alguno que quieran generar,
# simular 5 posibles trayectorias.
#Formato de entrega
#1) la entrega sera via Moodle
#2) el codigo debera tener por nombre la siguiente estructura: APELLIDOS_PROCESOS.R
#3) La entrega sera antes del sabado 12:00

#                                 Solución

# MAtriz de trancision para tres estados con la siguiente matriz de transición:
#    |0.6 0.2 0.2| = 1
#P=  |0.3 0.5 0.2| = 1
#    |0.3 0.3 0.4| = 1

P1 <- t(matrix(c(0.6,0.2,0.2,
                 0.3,0.5,0.2,
                 0.3,0.3,0.4), nrow=3, ncol=3))

n<-40

num.chains<- 5
num.iterations <- n
num.iters<-n
estado_inicial<- 3

# cada columna almacena la secuencia de estados para una sola cadena
chain.estados  <- matrix(NA, ncol=num.chains, nrow=num.iterations)

# simulacion de la cadena
for(c in seq_len(num.chains)){
  chain.estados[,c] <- simulacion_MC(P1,num.iters=n, estado_inicial)
}

matplot(chain.estados, type='l', lty=1, col=1:5, ylim=c(0.5,4), ylab='estados', xlab='tiempo t')
abline(h=1, lty=3)
abline(h=3, lty=3)
legend('topright', c('Cadena 1', 'Cadena 2', 'Cadena 3','Cadena 4', 'Cadena5'), lty=1, col=1:5)

