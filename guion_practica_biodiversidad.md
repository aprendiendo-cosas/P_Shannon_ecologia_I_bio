# Instrucciones para realizar la práctica denominada "distribución de la biodiversidad en la Tierra"


> + **_Versión_**: 1
> + **_Asignatura (grado)_**: Ecología I (biología). Curso 2020-2021
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Duración_**: 6 horas distribuídas en dos sesiones de dos horas cada una.



## Objetivos

Esta práctica tiene los siguientes objetivos operacionales y competenciales :

 + Operacionales: Son los objetivos que nos planteamos satisfacer durante el desarrollo de la actividad. En este caso, los objetivos de este ejercicio son:
   +    Analizar la relación entre la distribución de los biomas en la Tierra y el clima.
   +    Discutir sobre las posibles excepciones a esta relación general. 
   +    Construir una gráfica que constate la relación anterior.
 + Competenciales: Se refiere al conjunto de habilidades o conocimientos que se espera que adquieran los estudiantes durante el desarollo de esta actividad.
   +    Mejorar su conocimiento sobre SIG. Concretamente en relación a las funciones de extracción de información de capas raster a puntos.
   +    Introducción a la programación con R. Se construirá una gráfica sencilla con este lenguaje de programación.
   +    Iniciación al concepto de flujo de trabajo como herramienta básica para planificar experimentos y procesos de análisis de datos ecológicos. 
   +    Fijar los conocimientos que relacionan la distribución de los distintos tipos de ecosistemas (biomas) con el clima (precipitación y temperatura). Estos conocimientos fueron adquiridos en las sesiones teóricas. 

Este documento contiene la misma información que [esta](https://github.com/Aprendiendo-ecologia/practica_biomas_clima/raw/main/downloadable_files/protocolo_biomas_vs_clima_v2020-2021.pptx) presentación, que se usará en clase como guía para la práctica. Por último, en [este](https://github.com/Aprendiendo-ecologia/practica_biomas_clima/raw/main/downloadable_files/guion_practica_biomas_vs_clima.pdf) enlace puedes descargar este mismo documento en formato pdf.


## Guión montañas
+ Importar el csv a qgis.
+ Asignar CRS: WGS 84 (EPSG: 4326)
+ Guardar como shapefile
+ Reproyectar a EPSG: 32737 porque es el que más se acerca a Kenya.
+ Generar mallas de 250 a 5000 m. La más pequeña no va a servir porque hay pocos puntos. 
  + Monte Kenya: el scxript de R va bien, pero no sale patrón porque hay muy pocas ocurrencias.
  + Monte klimanjaro: No se ve patrón.
  + MOnte olimpic (USA): no se ve patrón
  + Alpes: **también se ve patrón, pero más ligero**
  + Pirineos centrales: **Sí se ve patrón, pero solo a 2000 y 5000**
  + Sierra Nevada: **pos calaro que se ve patrón**
  + Chimborazo: *regular tirando a mal*
  + Montañas rocosas (California):


## Guión Gradiente latitudinal:
+ Descargar csvs de GBIF de estas zonas
+ Cargar los csvs en QGIS.
+ Decirle que no determine el tipo de campo. A veces falla el siguiente punto. Cuando qgis asigna un tipo de campo automáticamente realiza asignaciones diferentes dependiendo de cuál es el primer carácter que se encuentra en el campo.
+ Unir los csvs con la función merge vector layers. Elegir la opción guardar en memoria.
+ Exportar el resultado a un shape quitando los campos que sobran.
+ importar el csv en una base de datos. 
+ Esto lo he hecho para los primeros polígonos. Ver abajo.
+ ocurrencias_gradiente_1.shp tiene los siguientes sitios
    + Alaska
    + Bristish columbia
    + Sant helens mountain
    + Mendocino forest
    + Tutuaca (Méjico)
    + REserva de la biosfera Santuario Mariposa (Méjico)
    + parquqe nacional barbilla (Costa Rica)
    + Ecuador 
+ Para importar los siguientes a la base de datos, he tenido que ir importando uno a uno el csv original. usando el asistente de access para que importe solo el campo scientificname, que es el que nos interesa. Y en cada importación he tenido que compactar y reparar la base de datos.
    + Podocarpus
    + Medellin
    + Costa_rica
    + belice
    + baja_california 
+ En la base de datos (shannon_gradiente) hay varias consultas que calculan el índice de Shannon. También hay tablas que ordenan las zonas en función de su latitud.
+ La tabla final con el índice de Shannon se exporta a QGIS.
+ He creado un shapefile con los contornos poligonales de las zonas. Se llama zonas.shp.
+ Como los resultados no se ajustan bien al gradiente, he quitado algunas zonas... Al final el shape definitivo que usaré en la clase se llama "zonas_gradiente_latitudinal"
+ para ahorrar espacio, he comprimido todos los csvs de GBIF en "csvs_gbif.zip"

+ Uso este wms para mostrar el relieve: https://www.gebco.net/data_and_products/gebco_web_services/web_map_service/