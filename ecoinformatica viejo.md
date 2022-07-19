# Guión para generar un mapa de biodiversidad de Sierra Nevada usando datos de GBIF


> + **_Versión_**: 1
> + **_Asignatura _**: Ecoinformática (UGR)
> + **_Autor_**: Curro Bonet-García (fjbonet@uco.es)
> + **_Nombre release en Github_**: tarea_mapa_biodiv_v1_2019_2020_CCAA



## Objetivos





## Generación de un mapa de biodiversidad en Andalucía

En esta tarea tienes que trabajar con un mapa de biodiversidad de toda Andalucía que se ha generado aplicando la misma técnica que usamos en prácticas (consultas SQL en una base de datos). La única diferencia es que, en lugar de usar un inventario forestal de Sierra Nevada con 600 parcelas, hemos usado todos los datos que tiene [GBIF](https://www.gbif.org/) para Andalucía. Esto supone trabajar con una base de datos de 11.448.644 registros.

La imagen inferior muestra el mapa del índice de Shannon que obtuvimos en la práctica.

![Shannon sinfonevada](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/shannon_snev_sinfonevada.png)

Tenemos pocos puntos para identificar patrones espaciales en la distribución de la biodiversidad. Únicamente se observa que en las zonas ocupadas por pinares de repoblación (zona norte) hay menos diversidad. Eso se debe a que dichas formaciones vegetales albergan pocas especies por lo general.



Sin embargo GBIF tiene miles de puntos de ocurrencia de especies (de fauna y flora) en Sierra Nevada. GBIF es una infraestructura de investigación que se encarga de digitalizar y representar en un mapa cuando es posible la información contenida en colecciones biológicas de todo el mundo. En la actualidad tienen miles de millones de registros y se han convertido en una referencia para los investigadores que trabajan con biodiversidad. A través de la web de esta infraestructura se pueden descargar libremente los datos. Para hacer este ejercicio usé datos de toda Andalucía. Los puntos con presencia de especies se pueden ver en la siguiente imagen (son 11.4 millones de registros). Hay tantos, que apenas se distinguen.

![Puntos GBIF](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/occurrences_gbif.png)



El mapa de biodiversidad que usaremos en este ejercicio se ha obtenido a partir de esta capa de puntos. Cada punto representa la presencia de una especie, así que para calcular el índice de Shannon se necesita un marco espacial determinado. En esta ocasión se ha usado una malla regular de 250 m de lado. La imagen inferior muestra unas cuantas de estas celdas, así como los puntos de ocurrencia de especies que contienen.

![grid](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/grid.png)



Tras aplicar las instrucciones SQL que vimos en prácticas, se obtiene un mapa de biodiversidad de toda Andalucía a escala de 250 m que puedes descargar [aquí](https://github.com/fjbonet/teaching_task_biodiversity_map/raw/master/geoinfo/H_250.tif). La imagen de abajo muestra la distribución espacial de la biodiversidad en Andalucía según este mapa.

![shannon 250m](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/shannon_250.png)

## Tareas a realizar

Una vez repasada la metodología que usamos para generar el mapa de biodiversidad, repasemos los objetivos de esta tarea.

La idea es que los estudiantes aúnen lo aprendido en teoría sobre biodiversidad (y sobre los patrones que explican su distribución) con el conocimiento que tienen de la geografía de Andalucía para tratar de interpretar las siguientes situaciones:



#### Diferencias de diversidad entre los espacios protegidos de Sierra Morena y los de las Sierras Béticas



Observa con atención el mapa que ves abajo. Muestra el índice Shannon de todos los espacios pertenecientes a la Red Natura 2000 en Andalucía. Todos tienen un índice de Shannon alto, aunque hay diferencias importantes entre unos y otros. En la zona marcada como A en el mapa están los espacios situados en Sierra Morena. En la zona B están aquellas zonas protegidas ubicadas en las montañas Béticas. Se observa que la zona A parece tener una diversidad menor que la B. Se trata solo de una apreciación visual. Para constatarlo numéricamente deberíamos de aplicar un test estadístico. Pero supongamos que esta apreciación es correcta. ¿A qué crees que se debe este patrón espacial de distribución de la diversidad?, ¿Por qué los espacios protegidos de Sierra Morena parecen tener menos diversidad que los de las montañas Béticas?. Reflexiona sobre ello y responde las preguntas. Piensa en los patrones espaciales que determinan la distribución de la biodiversidad que comentamos en teoría (y que se comentan en el apartado de contextualización ecológica de este documento). A modo de pista, te sugiero que pienses en las diferencias de relieve que hay entre ambas zonas. 

![natura Shannon](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/shannon_natura_label.png)

#### ¿Gradiente de diversidad de oeste a este en Andalucía oriental?

Ahora observa con detenimiento la siguiente imagen. Representa la distribución del índice de Shannon en Andalucía oriental. A la izquierda del mapa puedes ver a Sierra Nevada. Almería y el Cabo de Gata están al este. A medio camino observamos el llamado "Desierto de Tabernas". Al igual que en el caso anterior, podemos observar visualmente un patrón espacial en la diversidad. Aparentemente la diversidad disminuye conforme nos movemos hacia el este. ¿Por qué crees que ocurre esto? ¿Qué variable ambiental podría explicar el patrón de distribución observado en la diversidad?. 



![shannon sureste](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/shannon_sureste_250_label.png)

Glups, [aquí](https://raw.githubusercontent.com/fjbonet/teaching_task_biodiversity_map/master/images/precipitacion_sureste_label.png) he dejado olvidada una pista.



## Material a entregar

Contesta a las preguntas anteriores razonando todo lo que puedas. El objetivo es que reflexiones y uses argumentos convincentes. No hay una solución única a las preguntas, así que no te obsesiones buscando lo que yo quiero que me digas. Se trata de que aprendas mientas haces el ejercicio. 

Deberás subir las respuestas al moodle en formato **word**, **libre office** o equivalente. No en formato **pdf**, por favor.



## Criterios de evaluación

En el moodle hay una rúbrica (pincha [aquí](https://es.wikipedia.org/wiki/R%C3%BAbrica_(docencia)) si no sabes lo que es una rúbrica) que describe de manera detallada los criterios de calificación. También puedes verlos en la siguiente tabla:


| Criterio de evaluación                                       | 0 puntos        | 1 punto                                           | 2 puntos                                                     | 3 puntos                                                     | 4 puntos                                                     | 5 puntos                                                     |
| ------------------------------------------------------------ | --------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Justificación de las respuestas**: Se refiere a el grado de justificación de tus respuestas, a la luz de la ecología. | No entrega nada | No justifica en ningún caso las respuestas.       | La justificación no se alinéa con nada conocido (por este humilde profesor) | Buena parte de las respuestas están correctamente justificadas. | Las justificaciones aportadas son coherentes.                | Lo que dices está tan bien justificado que me convencería si no estuviera de acuerdo con lo que dices. |
| **Adecuación**: Este criterio evalúa en qué medida los conceptos mostrados en la tarea se alinean con la idea de diversidad. | No entrega nada | No se observa nada relacionado con la diversidad. | Los conceptos teóricos en los que se basa el ejercicio aparecen tangencialmente. | Incorpora adecuadamente los conceptos de diversidad.         | Además de lo anterior, mencionas adecuadamente variables ambientales que pudieran explicar el patrón observado. | Excelente integración de marcos conceptuales diferentes. Además de los requeridos has incluido otros. |
| **Legibilidad:** hace referencia a lo bien escrito que está el texto y a su legibilidad | No entrega nada | Apenas entiendo lo que has escrito                | He tenido que reinterpretar casi cada frase para entenderlo  | Se entiende bien todo, pero el texto no es fluido            | Muy buena redacción. La lectura fluye fácilmente, cual novela. | Impecable estilo de escritura.                               |



