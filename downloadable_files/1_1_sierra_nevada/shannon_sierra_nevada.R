# Este script calcula el ?ndice Shannon de Sierra Nevada
#a una escala de 250 m usando la información existente en GBIF

## Establece directorio de trabajo
setwd("//cifs/bv2bogaf/Documents/shannon")

## Carga paquetes que necesitamos
install.packages("rgdal")
library(rgdal)

install.packages("sqldf")
library(sqldf)

## Importa la capa con las ocurrencias de GBIF
ocurrencias<-readOGR(dsn=".", layer="ocurrencias_sierra_nevada_23030", verbose = FALSE)

## Importa la capa con la malla de 250 m
grid250<-readOGR(dsn=".",layer="grid_250", verbose = FALSE)

## Uni?n espacial: asigna a cada punto el c?digo de la cuadr?cula en la que se encuentra.
ocurrencias$id_250 <- over(ocurrencias, grid250)$id

## Extraer la "tabla de atributos" para hacer los cálculos del índice de Shannon
bio<-ocurrencias@data

## Calcular el índice de Shannon

### Calcular el número de individuos por especie y por cuadrícula (num_ind_sp_cuad)
T_num_ind_sp_cuad<-sqldf("SELECT id_250, scientific,  count(scientific) num_ind_sp_cuad  FROM bio GROUP BY id_250, scientific")

### Calcular el número total de individuos por cuadrícula.
T_num_ind_cuad<-sqldf("SELECT id_250, sum(num_ind_sp_cuad) num_ind_cuad FROM T_num_ind_sp_cuad GROUP BY id_250")

### Fusionar las tablas anteriores para calcular Pi
T_num_ind_sp_cuad_mas_num_ind_cuad<-sqldf("SELECT id_250, scientific, num_ind_sp_cuad, num_ind_cuad FROM T_num_ind_sp_cuad LEFT JOIN T_num_ind_cuad USING(id_250)")

### Calcular pi por especie y por cuadrícula.
T_num_ind_sp_cuad_mas_num_ind_cuad<-sqldf("SELECT id_250, scientific, num_ind_sp_cuad, num_ind_cuad, (num_ind_sp_cuad*1.0/num_ind_cuad) pi FROM T_num_ind_sp_cuad_mas_num_ind_cuad")

### Calcular el log2 pi por especie y por cuadrícula (log = ln). Log2(pi)=log(pi)/log(2)
T_num_ind_sp_cuad_mas_num_ind_cuad<-sqldf("SELECT id_250, scientific, num_ind_sp_cuad, num_ind_cuad, pi, (log(pi)/log(2))*pi lnpi_pi FROM T_num_ind_sp_cuad_mas_num_ind_cuad")

### Calcular H por cuadrícula
T_Shannon<-sqldf("SELECT id_250, sum(lnpi_pi)*-1 H FROM T_num_ind_sp_cuad_mas_num_ind_cuad GROUP BY id_250")

## Fusionar la tabla que tiene el índice de Shannon con la malla de cuadrículas.
grid250<-merge(x = grid250, y = T_Shannon, by.x = "id", by.y = "id_250")

## Exportar la capa resultante a un shapefile.
writeOGR(grid250, dsn=".", layer="Shannon_250_sierra_nevada_R", driver="ESRI Shapefile", overwrite=TRUE )




