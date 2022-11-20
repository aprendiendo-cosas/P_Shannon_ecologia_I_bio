# Instrucciones para realizar la práctica denominada "Construcción de un mapa de diversidad de Sierra Nevada"


> + **_Versión_**: 2022-2023
> + **_Asignatura (grado)_**: Ecología I (Biología). 
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es); Jordi Tobajas (sc2togoj@uco.es).
> + **_Duración_**: dos sesiones de 2 horas cada una.



## Objetivos

Esta práctica tiene los siguientes objetivos:
+ Disciplinares:
  + Reconocer el concepto de biodiversidad ya estudiado en las clases de teoría.
  + Aprender un método para cuantificar la diversidad biológica. Índice de Shannon.
  + Aprender a generar mapas de diversidad biológica. Mapas de distribución del índice de Shannon.
  + Reconocer patrones de distribución de la diversidad en un territorio concreto (Sierra Nevada).
  + Identificar las causas de los patrones anteriores.
  
+ Instrumentales:

  + Afianzar nuestro conocimiento de SIG.
  + Dar vuestros primeros pasos programando con R.
  + Aprender algunos conceptos básicos de las bases de datos relacionales.  
  
   


## Contextualización ecológica

Como sabemos, la cantidad de especies que hay en una comunidad ecológica es importante para entender muchas características estructurales y funcionales de los ecosistemas. En concreto hay dos descriptores importantes: riqueza de especies y diversidad. La riqueza de especies es fácil de entender: es la cantidad de especies que hay en una comunidad dada. Es un descriptor importante, pero tiene varios problemas para ser usado de manera estándar. Uno de ellos es que depende del esfuerzo de muestreo de especies. Es posible que lugares con muchas especies den valores bajos en este parámetro si no han sido suficientemente muestreados. Para minimizar este problema se usan otros indicadores de diversidad. En nuestro caso trabajamos con el[ índice de Shannon](https://es.wikipedia.org/wiki/%C3%8Dndice_de_Shannon), que tiene en cuenta tanto el número de especies como su abundancia relativa. 

La diversidad biológica se distribuye por la Tierra según una serie de patrones espaciales que vimos en las sesiones teóricas correspondientes. Dichos patrones ponen de manifiesto cómo se comporta la diversidad frente a ciertos factores ambientales. Por ejemplo:

+ Heterogeneidad ambiental. Se ha comprobado que los lugares más heterogéneos desde un punto de vista ambiental (más cambios en las condiciones climáticas, por ejemplo), albergan más diversidad.
+ Dureza ambiental. En multitud de ocasiones se ha comprobado que los lugares sometidos a más perturbaciones o más fuentes de estrés, tienen menos diversidad biológica.

En [esta](https://github.com/aprendiendo-cosas/P_Shannon_ecologia_I_bio/tree/2022-2023/bibliografia) carpeta hay varios artículos que describen  con detalle estos patrones y algunos más. 



La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/p/zphobtzmub50/?present=1) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ecologia_I_bio/raw/2022-2023/presentacion/practica_mapa_biodiversidad_R.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_ecologia_I_bio/raw/2022-2023/presentacion/practica_mapa_biodiversidad_R.zip) para Mac. 




<p><iframe src="https://prezi.com/view/ACfMCVaCBbJVoGwMJZaY/embed" width="1200" height="900"> </iframe></p>



## Metodología y flujo de trabajo

Como se puede observar en la presentación anterior, para calcular la diversidad de una comunidad, necesitamos dos fuentes de información:
+ Información de distribución de especies en la zona de estudio (Sierra Nevada). Es el primer paso fundamental porque necesitamos esta información para calcular el índice de Shannon. Para conseguir datos de presencia de especies en Sierra Nevada usaremos una infraestructura digital denominada [GBIF](https://www.gbif.org/) (Global Biodiversity Information Facility). Se trata de un portal desde el que se tiene acceso a millones de datos de presencia de especies procedentes de colecciones biológicas (herbarios, colecciones animales, etc.) de todo el planeta. Esta iniciativa está promovida y mantenida por multitud de países que han puesto en común toda la información de la que disponen para conocer mejor la distribución de la biodiversidad en la Tierra.  [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/geoinfo/ocurrencias_sierra_nevada_23030.zip) puedes descargar la capa con los datos de presencia de especies de Sierra Nevada. Cada punto representa la presencia de un individuo de una especie determinada. Los datos se han obtenido a partir de colecciones biológicas y trabajos de muestreo de campo. Como ves más abajo, son unos cuantos miles de puntos...

![puntos](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/imagenes/puntos.png)



+ Distribución de las comunidades ecológicas que conforman Sierra Nevada. Este paso es el más complejo conceptualmente, ya que las comunidades no tienen un límite espacial preciso. Es decir, están conectadas entre sí y no es fácil delimitar donde empieza una y acaba otra. Usaremos un mapa de vegetación para delimitar las comunidades de Sierra Nevada. Asumiremos que cada polígono de dicho mapa es una comunidad ecológica. [Aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/geoinfo/vegetacion_snevada_23030.zip) puedes descargar el mapa de comunidades que usaremos en esta práctica. El enlace anterior contiene un fichero de formas con la delimitación de los polígonos del mapa de vegetación a escala 1:10.000. La siguiente figura muestra la delimitación de estas comunidades en Sierra Nevada. Aunque el mapa no tiene escala, podrás reconocer el contorno del espacio protegido de Sierra Nevada.

![comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/imagenes/comunidades.png)



A partir de estas dos fuentes de datos obtendremos el índice de Shannon para cada una de las comunidades de Sierra Nevada. Es decir, usaremos los datos de presencia de cada especie que hay en cada una de las comunidades para calcular su índice de Shannon. En la siguiente figura puedes ver la distribución de ocurrencias de especies en unas cuantas comunidades.

![puntos_comunidades](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/imagenes/puntos_sobre_comunidades.png)



Para ello seguiremos los pasos que se muestran en el siguiente flujo de trabajo (se ve un poco pequeño, pero si vas a la parte de abajo encontrarás una herramienta lupa para aumentar y otra para desplazarte). También puedes descargar el flujo de trabajo [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/presentacion/sierra_nevada_shannon_QGIS_R.drawio.zip) (se abre con [esta](https://www.diagrams.net/) aplicación). Se lee de abajo a arriba.

<iframe frameborder="0" style="width:100%;height:2116px;" src="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=sierra_nevada_shannon_QGIS_R.drawio#R7V1bk5s4Fv41rprZqu4CJHF57Fuy2c3WZKZnJpt9cclGttkA8gjcbe%2BvXwkkbpLdpNsXHOelY46EEOfTueqIjMBdsn7P8HLxLxqSeORY4XoE7keOAyyX%2FxWETUlwfOSUlDmLwpJm1YTH6H%2BkJNqKuopCkklaScopjfNo2SZOaZqSad6iYcboc7vbjMZhi7DEc9KahiA8TnFMtG6fozBflFTf8Wr630k0X6gn225Qtkzw9Ouc0VUqnzdywDv0Dr6TAyZYjSWfmy1wSJ8bJPAwAneM0rz8lazvSCx422bbuy2t1bwZSfM%2BN3wGj%2FGf4Yz9Z7OhX4PP%2Fi1awytXvuYTjldEvUcx23yjOFS8IxGj2CNw%2B7yIcvK4xFPR%2BszXBKct8iSWzTOa5hJkn19S3jHKxdqAlmiN4viOxpQVI4MQE3825fQsZ%2FQrabS4U59MZrxFf0v54k%2BE5WTdIMm3fk9oQnK24V1UqwMlBHKNXvnl5XONNwSyy6KJNVTrTK6xeTV2zWf%2BQ7L6W9juHpbtHT7PZsSdGvkcesHEsnSg9sJ24LfZbge%2BpXMemjgfuNaBWG9DjdMk5BpBXlKWL%2Bicpjh%2BqKm3NRYFr6o%2BHyldSgT%2BS%2FJ8IyHAq5zuxIeso%2FzfYrRrJK%2B%2ByLHF7%2Ft182IjL7ZCktEVm5Jdqw1JvYrZnOS7eCNHFAzZCTEjMc6jp7YK3T9U%2Fimg4uxlmwY44vJLs62Gp7hS%2BJwWYtAXYndYEIMzhvj1cClBexEud2ASqaxAbbc%2BJEuOAGacSqcrxnkxjfhzHTfm73U74XR3nhfMKimRIjCCw1%2Fe%2F7a950QRbKRIfNITrZt2I%2B8V1bSuWV3QZLLKvsmkevuyiJ5YcC2bGOgWEbm6QVS0vSNaeacXZA77Cp8dDEv40Il1JXTb2vLasr1vNIqi8RNhEecIYW9GUhmzl9WoMywkdfe%2FVqNdrZbgOMb71af%2Bd6JPQQA62tTWtaln0KbeobSprfHnu9emznlqU5WmOi1UDeXqu03lal0H1fUW3bpnZdobSGTtG8ji1hvG8KbRYUmjNM8aI38ShIb0o25ax4ZOc1n0uQNBf%2Fct0A9238J%2FlDPfNkCwZZbVi5bIyPt2Tt%2BFW%2BZSjVWCp41VSEiFzBv024WGa0FfP2PvovE2PyPQ%2FIybLJqnRbTGfQpLt%2FlTHOJWKCfeJjb6BjgRFj6dZOIfPg%2FHCgn%2FI5wVa7rCIRvdgdHN%2FXRlcl9Iqrr%2BtRJ3kSwvutvXPVwdyn2EHn6O4Ov34ec4HR0CgKsCyYar49u6q%2BMfam05p45Gzig5Z%2FVUHw4clPpQe2BnCfHr4VIovAzXsHKpat4Nbf%2BwzhkWupK%2FzMSkhguNjXMWTTgOmVLhrUSe4GFhEpaEFYZjStPCKOyKSjVtWylWMUuTujUp6kGpYK%2BtgpGrZ%2B48qLRyUwXX1P1DHlymhPbN%2Bzj%2BoCQUnLPNPAJcAAwKLkdP000iqqulFkDfuFEvLuVQzl70FPCvnc4eg%2BsYNhkcXVGBQ%2B25g5OkxU6%2F7v2%2B635YYaOad2Pd3%2BFYxHHC%2FKejO2d0eyMGScPoKQpX1Lzd14oPl1Tcy3%2BKZcnZWVy%2BGCVq3sPjrx%2F7xm%2FdYDDYFQxmS5y2Fqj714oW8XBZKyNel80n%2BCeriJo5Xy3jr5%2FFTzGsJVbR1QwnUbwpb09oSrNCL7S6ZMVKEx2s5bp%2Brppgq%2BwOcRD5n7JorLpSoKICVk65F7%2FFlJCAEfG18FJfu%2BqrFvqrhnHqYcq1U7VUjiiqXFFUOpuo5X%2FWxJYPipQXimo%2FFElPFClfVD26BLF6tPIaOaGpnEV7oZ4FvdAagmIXl5UGECSvIDXerFTGfXhXNVVsq2UZCZ1d9yz8SzXOpm4o%2FUzVUCrwqrH0LFWjVOVbWgs2ypZ5YxZdaIvLCt8msb3qZD9teVYyVorUAF35ys4p%2B%2Bip%2FaCGfQxskytfU%2FdvI8%2B52On1NhL0zY2AYQXbat6tCs7KWBkMSUfZeyZl%2F%2Fs4XSVjblbH2XIsjGO%2FzOQb%2FM%2F9yFOnztOHhtDYUNRyOH%2FTuUxZ6lsECIaVZ1Tz3r%2B%2FeXw3Ezhn6WYaDPkPP%2FOHn%2FnDz3xTdVJnu34YfuZlpoxB302dofmZ%2BqbOPv3Ms3EyoeUMzMmEl5nUBH2T%2BXBYSU2gJ%2FP%2FSCM2kn6C2Og0eIbcm3gqPMeg3BwVj5lyR5OKf2kimm5vUv2%2Bn3bXw%2Fx8WB90y3mJIdlGu2MbTUcDj24b4WWWt8G%2BORhVuTgQkYbbczBbA60%2B5lETRS0vM05w1sOG9vRRT52%2F8VH3VJJtGaobbOib5PFwBvYyd8uVkL0sjcPK4qh5m7M4n6JRufMX07kjLg5p%2F%2FwyTQK31H8O2Q7atuFE4PEN4WVW%2FsG%2BQSIcVpAItweJPwzh2wyh4w3AEF5mygb2jjSHVeUH9UjzcZVIK%2Fi3j9L%2BGc5e4Dkjc5yGIrgsdi60wxlH3MjQhoJnWrirWVhoKIc7uoVFl5k9gn1L4vZ%2FyPBtMq2XxB3Kwj4ucJrS9JwNKXC8a69rSZGli5060HgUM4pO8uWnk4sc6pvdQcOqvkZ6duemyLfaOCzyts0DjJWIiI8MOsjaIj2tEgHTscZOgrc86CKeUxjdNIzEjq7xEE0ttq2H9LDRCeHA7LTJ2r2VqRWB2sANMIRQ86pdw%2BbN8U2we5n6oG%2BVEELD0gd6lVAl7B0YswVeip%2BiliOOSUznDCecacvGxxJabY2vKLwoIdGaqM%2BYHuNAB1TvVwmPB3ThUbsnxzGkl1mqquThZcHxhiU4SBOch3X10TZc2q4lmUWxwbZp1uqZcfHY%2BZ2hnWFlyzQP12B1j1DZvmFD5PgWy%2FS13m7EX%2FohY64Xx1lEGMPjlDzhEF9ni2WvUo8Tas%2B9wGfb17Ab8wfIkMZD3rXtHFFvuq%2FYr2wXhprrQndUg1bu6MgBAAosSPxE8miKtZbRlnpRX8StzaZnySvRCMt5FI0xV9%2BEXYni0yidl%2B0pZQmOqy4cw%2FwKx9E8LZunHOfieHqjOeJmIs0btarNxpzhNJvxQdXwaV3n%2BkxZ2H568%2Fb6c91XHZ46IriXvHRErlX9Rg3OhlG2jLHkapTGUePBs5jivDmhF6P8VtEpjMLx9pClV8B%2F5iILrM5HlqDBxbEtoMsqPJis6l86bYE2HAD27nE6qPNVPdto%2BwyK81B2T32a7MJcf%2BB1vz12ciD0GOyJcGeY61zucmSlozHmFhRYpbvxfaPTyWt4UFda5k%2BCHA4g3ddvqK22Q3ghONlKQhRK%2BjdCbc8%2FDEa%2Ff7l6eAi%2B%2FMPBj3Dzz8%2FZx6%2B%2FfLjSLcuv7z88ahgIf6fNOek43UuvCdwKLnBXLr6RDUkUhmWwTbj%2FhifFUMJJkd9S5OOi2xG6F2OJczBGEOwuCvY%2BUECoLSu2LivugXIYRhB0i%2FLbd46Aa3WCIseQhDX9NyivwGAkT%2FHUbY3zO%2BDh%2Fw%3D%3D"></iframe>

La ejecución del anterior flujo de trabajo se realiza usando R. R es un lenguaje de programación muy potente. En esta práctica haremos una especie de "bautismo" en el uso de esta herramienta. Al principio te resultará complicado, pero poco a poco te irás familiarizando y acabará gustándote. Es altamente probalbe que uses R tanto en cursos superiores del grado como en tu actividad profesional futura (sea cual sea). 

Para maximizar la potencia de R usamos un interfaz gráfico que nos facilita las cosas. Se llama RStudio. Tienes docenas de vídeos en youtube sobre Rstudio. Te recomiendo que mires alguno antes de hacer la práctica.

Para generar el mapa del índice de Shannon de Sierra Nevada deberás de ir dando los siguientes pasos: 

1. Abre Rstudio
2. Dale al botón archivo y crear nuevo archivo de R.
3. Guarda el archivo de R en tu directorio de trabajo. Ahora iremos pegando en ese archivo las líneas de código siguientes:
4. Primero establecemos el directorio de trabajo. Sustituye lo que hay entre comillas del código que hay abajo por tu ruta. Para acceder a la ruta, usa tu explorador de archivos, ponte sobre la barra de navegación, botón derecho y copiar ruta en modo texto. Ten en cuenta que en windows, cuando copies la ruta de la carpeta, pondrá las barras hacia la izquierda (así: \\). Tienes que cambiarlas a mano y ponerlas hacia la derehca (así: /)

```R
# Este script calcula el Índice Shannon de Sierra Nevada
#usando un mapa de vegetación y la información existente en GBIF

## Establece directorio de trabajo. No olvides cambiarlo por el tuyo.
setwd("//cifs/bv2bogaf/Documents/shannon")
```

5. Copia el siguiente código. Su función es instalar en R una serie de funciones que necesitamos para generar el índice de Shannon. Una vez instalados (con la función *install.packages*), los cargamos en la memoria del ordenador (con la función *library(nombre del paquete)*).

```R
#Carga paquetes que necesitamos
install.packages("rgdal")
library(rgdal)
install.packages("sqldf")
library(sqldf)
```
6. Ahora importamos la capa que contiene los puntos de presencia de especies descargados de GBIF. También importamos la capa con la delimitación de las comunidades ecológicas.

```R

## Importa la capa con las ocurrencias de GBIF
ocurrencias<-readOGR(dsn=".", layer="ocurrencias_sierra_nevada_23030", verbose = FALSE)

## Importa la capa con las comunidades ecológicas
comunidades<-readOGR(dsn=".",layer="vegetacion_snevada_23030", verbose = FALSE)
```

7. A continuación asignamos a cada punto de presencia de especies el código de la comunidad ecológica en la que se encuentra. Usamos una función llamada *over*.

```R
## Unión espacial: asigna a cada punto el código de la comunidad en la que se encuentra.
ocurrencias$id_com <- over(ocurrencias, comunidades)$id
```
8. El siguiente paso implica extraer la tabla de atributos del objeto que hemos creado. Hacemos esto porque R necesita "eliminar" la parte geográfica para poder hacer operaciones con la tabla.
```R
## Extraer la "tabla de atributos" para hacer los cálculos del índice de Shannon
bio<-ocurrencias@data
```
9. Los siguientes pasos consisten en realizar varias operaciones con la tabla anterior y construir otras tablas con las que calcular el índice de Shannon.

```R
## Calcular el índice de Shannon

### Calcular el número de individuos por especie y por comunidad (num_ind_sp_com)
T_num_ind_sp_com<-sqldf("SELECT id_com, scientific,  count(scientific) num_ind_sp_com  FROM bio GROUP BY id_com, scientific")

### Calcular el número total de individuos por comunidad.
T_num_ind_com<-sqldf("SELECT id_com, sum(num_ind_sp_com) num_ind_com FROM T_num_ind_sp_com GROUP BY id_com")

### Fusionar las tablas anteriores para calcular Pi
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com FROM T_num_ind_sp_com LEFT JOIN T_num_ind_com USING(id_com)")

### Calcular pi por especie y por comunidad.
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com, (num_ind_sp_com*1.0/num_ind_com) pi FROM T_num_ind_sp_com_mas_num_ind_com")

### Calcular el log2 pi por especie y por comunidad (log = ln). Log2(pi)=log(pi)/log(2)
T_num_ind_sp_com_mas_num_ind_com<-sqldf("SELECT id_com, scientific, num_ind_sp_com, num_ind_com, pi, (log(pi)/log(2))*pi lnpi_pi FROM T_num_ind_sp_com_mas_num_ind_com")

### Calcular H por comunidad
T_Shannon<-sqldf("SELECT id_com, sum(lnpi_pi)*-1 H FROM T_num_ind_sp_com_mas_num_ind_com GROUP BY id_com")

```
10.  El penúltimo paso consiste en fusionar la tabla que acabamos de crear con el mapa de comunidades ecológicas. 

```R
## Fusionar la tabla que tiene el índice de Shannon con el mapa de comunidades.
comunidades<-merge(x = comunidades, y = T_Shannon, by.x = "id", by.y = "id_com")
```
11.  Por último exportamos la capa obtenida a un fichero de formas fácilmente visualizable en QGIS.

```R
## Exportar la capa resultante a un shapefile.
writeOGR(comunidades, dsn=".", layer="Shannon_comunidades_sierra_nevada_R", driver="ESRI Shapefile", overwrite=TRUE )
```



La siguiente presentación muestra paso a paso el flujo de trabajo. También puedes verla [aquí](https://prezi.com/view/gOJNmvizzKEsXVxEHe3I/). Ten en cuenta que la siguiente presentación contiene algunos pasos extra que no hemos visto aquí. Concretamente empieza antes, descargando los datos de presencia de especies directamente desde GBIF.




<p><iframe src="https://prezi.com/view/gOJNmvizzKEsXVxEHe3I/embed" width="1200" height="900"> </iframe></p>






## Resultados esperables
El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de un fichero de formas vectorial en el que se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. Aquí se puede descargar dicho fichero de formas.



![shannon](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/imagenes/shannon_snev.png)



En el mapa resultante se pueden identificar varios patrones de distribución espacial de la biodiversidad en Sierra Nevada. Durante la práctica reflexionamos sobre dichos patrones:

+ ¿Cómo cambia la diversidad al aumentar la altitud?

+ ¿A qué se puede deber dicho patrón?

+ ¿Crees que se repetiría el mismo patrón en otras montañas de la Tierra?

+ ¿hay algún patrón de cambio de diversidad en dirección este-oeste?

+ En caso afirmativo, ¿a qué puede deberse?

En el moodle deberás de subir un documento de texto contestando a las preguntas anteriores.



## Vídeos de la práctica sin estudiantes

Este vídeo muestra el desarrollo de la práctica pero hay una diferencia respecto a lo que veremos en la sesión en vivo. En el vídeo el mapa de comunidades ecológicas se sustituye por un mapa de cuadrículas regulares de 250 m. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/6OOusJU4ljs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

