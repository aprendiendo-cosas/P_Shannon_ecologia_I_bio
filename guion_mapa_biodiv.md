# Instrucciones para realizar la práctica denominada "Construcción de un mapa de diversidad de Sierra Nevada"


> + **_Versión_**: 2022-2023
> + **_Asignatura (grado)_**: Ecología I (Biología). 
> + **_Autores_**: Curro Bonet-García (fjbonet@uco.es); Jordi Tobajas (sc2togoj@uco.es).
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



La siguiente presentación muestra los conceptos básicos necesarios para hacer la práctica. También puedes verla [aquí](https://prezi.com/p/zphobtzmub50/?present=1) y descargarla [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/presentacion/practica_mapa_biodiversidad_R.exe) para Windows y [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/presentacion/practica_mapa_biodiversidad_R.zip) para Mac. 




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

<iframe frameborder="0" style="width:100%;height:2116px;" src="https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=sierra_nevada_shannon_QGIS_R.drawio#R7V1bc6M4Fv41rprZqqS4SIAfc%2Bve3u2t6RnPTG%2Fvi0s2sq1tjDwCJ%2Fb%2B%2BpVAAoHkhCR2jNt5SZsjIcT5dK46ogf%2BzXLzkaHV4l80xsnAc%2BLNwL8deB5wXf5XELYlwQuiYUmZMxKXNKcmjMj%2FcEl0FXVNYpxJWknKKU1ysmoSpzRN8TRv0BBj9KHZbUaTuEFYoTluTEMQRlOUYKPbVxLni5IaeWFN%2Fzsm84V6shvI95ug6fc5o%2BtUPm%2Fg%2BR%2FgB%2FBBDrhEaiz53GyBYvqgkfy7gX%2FDKM3LX8vNDU4Eb5ts%2B7CjtZo3w2ne5Yav%2Fij5M56x%2F2y39Pvwa3QNN%2BAikK95j5I1Vu9RzDbfKg4V74jFKO7Av35YkByPVmgqWh%2F4muC0Rb5MZPOMprkEOeKXlHckuVgbwBGtJEluaEJZMbIfIxzNppye5Yx%2Bx1pLMI3wZMZbzLeUL36PWY43Gkm%2B9UdMlzhnW95FtXpAQiDX6EVUXj7UeANfdlnoWAO1zuQam1dj13zmPySrn8P24LBsb%2FF5NsPB1MrnOBxOHMcEai9s96Mm291h5JicBzbODwPnQKx3gcFpHHONIC8pyxd0TlOU3NXU6xqLgldVn8%2BUriQC%2F8V5vpUQoHVOH8UHb0j%2BbzHaJZRX3%2BTY4vftRr%2FYyoudkGR0zab4sdUGpV5FbI7zx3gjRxQMeRRihhOUk%2FumCt0%2FVNExoOLsZVsNHHH5TW%2Br4SmuFD7HhdjvCnHQL4j9E4b45XApQXsSrqBnEqmsQG23Pi1XHAHEOJVO14zzYkr4c70g4e91PeH0YJ4XzCopRBEYRvEvH3%2Fb3dOk8DmTmta2lwu6nKyzZ9nKcF%2BmLhQrqWHshqapg4Fp6RRt71BVbucZ2bmuUuUO%2ByVV8MhKEARNNXjpuOEzrZ1o%2FIIZ4RzB7NVIKiv1tH70%2BoWk6dfX%2BrGt1e4xfzfuddP0zLSlP%2FRbutI1dWVo0ZXhoXSla%2FDnh9eV3mnqSmgGykeASlOdUaCrTudyWF3v0Jx7VpWdgYTOvoEsbr1iDG21DitK0jzTRv4iCJr0w3Y2xgWeviy63AFB9PgtQGUhd93Cf5Qz3zXAcMcsqxctkZH3PTr9AOyYSzVWCZ4xViEhFTKv0G9nGmUNu3oRexeN13kRQ8OLuMrIPC2CLDQQnn3b5k9RjBoRmHibxOoboKWw8OkkE%2F%2FweXhOjPmfRNwypct1SmIUm3fiVHX6ay364ywf3PiDK%2Feyg%2FdCuXfwY7guXkst%2BH6gIj%2FNe4lc03uJDrVcvGOHDyeUJnM6agQP9EojqN2ok4T45XApFJ6Gq19ZTTVvTYHfbXKGhBLkLzMRarSt%2BgoljHJGJhyHTGnlRkpN8LDQ8ivMClswFaEj1%2FNivF4pybCpJGFgJsNCoPSmriRr6v5BGZ6nDHVNpXhRr2TIP2Wr9gZw%2BX6v4PLMzNeEUFMtNQB65qa2uJRDeXvRU3506bXS9oFnydt7pqLyD7U%2F7R8lF3X8dR91Xff9itXUvLV1f4OS6TopDHQ6uPEG11dikDQm9yReU%2FvWWCMoW1FxL%2F8pliVnJ2WPh2ZGuDX69XPX2KqkZSuUNtZc8NeaFnFlWSoi3oDNJ%2Bgnp4g%2BOasc66%2BfxU8xrCMWxsUMLUmyLW9f0pRmhag3umTF4hEdnNWmfm49QcjB4H%2FKQqnqSoEDC3g45Vb8FvOAAg7IMX2qr1v1VQv2RcN49TDlGqhaKpcPVk4fLN062PD0amLD24PK34O1xwelzweV16ceXSJXPVp5f5ygK1nRXqhZQS%2BkX1Dc4rKSZEEKC5L2ZqVS7cK7qqliWy2TUOjeumfhJ6pxtnVD6S%2BqhlIRV42lh6gapUre0VqwUbbMtVm0oS0uK3x1YnPVyX56JWTRVAlWKUc9zFtU9krZuVBtpmh2bujaXPKaun9bd8oFPi%2B3dX7XLITfr7BWzbtRtViZHov1aGn40Kbhfx%2Bn6%2BWYm8dxthpzI9ctBfgKN3I%2F4tQqbYyAJcK1lHsczm30zlOUuta9%2Bf1K6Kl5799tfPcT3%2F3Edz%2Fx3U98YUpk2Nqr7oefeJ6pW7%2Fr9kff%2FERz%2B2OffuKpOInA8XrmJILzzC36XXPqoF%2B5Rd%2FMqf%2BREjaQboLYEbRsJHJn4r6ozBiWu4jiMVPuKNLSORRN11eWktOfdtWC%2FLxfT7JP1s5tWTvbAbU3t3bgPKu1QNesiCrE64mUgt1ZkZ3hUheDZ8hYO1MyXqLsaaPY0ec8dkIlgu0DNK5jqRpwQWSTxsNZzPPchVYi9rQs9iutouZtT6t8IYNyRy2hc09cPMesnY4Rc13L2bO3t2LnWbIGusZsoF8xG9gds71bsddYMS%2FsgRU7z%2FwJ6Bz39av0DZhx32i9lCbsb5%2Bl8bKcAkBzhucojUWoV%2BwGGMcEtM2Bxt7B%2BYR4LrBUeL25dYTnmYkBXau89n9Y7XUSaVZ5Hco6jhYoTesjwadoBn0vvAzbdhA6ptipg3FvYgThUT78c3SRg13TKrBfBcXQTKtcFblLF8VFDlQ%2FCEcMA4ezHRLUMHu2I3KthGl5wkI8S%2BRUb9OYiA1S6%2BmNWnSfa1uXmIPTe1sKADDc28Cyp%2FH21jQ4T9HuWvwCYb9E2yx%2BachtC8psgVbip6hySBKc0DlDS864lXaGvtGmHa5%2FUkrIBquPUr7FkQOg1FolQKFvCpDahXgbu3ieRZhKJp4WnrBfwgMN4bnbVJ%2FgQqUZWuEZSSxmyjA8D4yLx6PflbE5oBNFgI7WbdJbo9U%2B5ONGlq2Ft7datm%2BvtoPu0qUYa%2FpxnBHMGBqn%2BB7F6DJbrDo5DkfUonuB0XEuPa8F41CF0XpuLRxe2j60djD9Gbxg%2F69ZLmmvlnykRrLyMAee7wOBBU7ucU6myGgZ7KiijEQ4qjc9SF6JRlDOo2hMuBrH7EKUZJJ0XranlC1RUnXhGOYXKCHztGyecpyLo85aM%2BHmIs21Ck69MWcozWZ8UDV8Wld%2FPlAWN5%2Bu315%2FhPmixVNPxOySl55IgKrfUONsTLJVgiRXSZoQ7cGzhKJcn9CTwXujLBOQV6ezT1xkfaf1DR5gcXVcxzdlFRxMVs3vVzZA6w8Ae%2Fc8Pdj66JprtYEWxXko%2B6e%2BXHWGYYAftj9PdXQwzJis%2Fj7hOCudjTG3or5Tuhw%2FNjqtPEcILH6G9QMWhwPI9Ps11dV0Cs8EJ1dJiELJ5g1Gh8Ho928Xd3fDb%2F%2Fw0Ahs%2F%2Fk1%2B%2Fz9l08XpnX59eOnkYGB8HmanJPO0630nMS3QZlw55Ir2bAkcVwG3pj7cGhSDCUcFfm5PT4uvB7AWzGWOC1iBcFto%2BDuAwUIm7LimrISHCifYQXBtCq%2F%2FeAIBE5rj9OzJGVt%2F8HFCzAYyLMudZt2ysW%2F%2Bz8%3D"></iframe>

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
El siguiente mapa muestra el resultado obtenido en esta práctica. Se trata de un fichero de formas vectorial en el que se ha asignado el valor del índice Shannon a cada polígono del mapa de vegetación inicial. Si no has podido completar la práctica, [aquí](https://github.com/aprendiendo-cosas/P_shannon_ecologia_I_bio/raw/2022-2023/geoinfo/Shannon_comunidades_sierra_nevada_R.zip) se puede descargar dicho fichero de formas.



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

