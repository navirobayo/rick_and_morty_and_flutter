# Rick And Morty And Flutter


<p align="center">
  <img src="https://github.com/navirobayo/RickAndMortyAndFlutter/blob/main/repoassets/cover3.png" width="350" title="hover text">
</p>

Este documento está diseñado para explicar la estructura de la aplicación la cual utiliza la información disponible en la API de Rick y Morty. Si quieres instalar la aplicación en tu celular puedes hacerlo directamente con el archivo .apk que puedes descargar acá: 
[[+]](https://github.com/navirobayo/RickAndMortyAndFlutter/blob/main/repoassets/app-release.apk)

La aplicación está escrita en inglés, principalmente porque la información de la API también lo está. Los comentarios dentro de la aplicación también están en ingles y en mi caso he creado la aplicación con Visual Studio Code, donde utilizo la extensión "BetterComments" para resaltar ciertos comentarios. 

# Características principales:

- Lista o exploración de personjes.
  
- Lista o exploración de episodios.
  
- Busqueda de personajes por nombre.

# Estructura de las carpetas:

- blocs: Contiene los "blocs" que se utulizan en las tres funciones principales de la app. 

- models: Contiene los archivos que convierten la información JSON a código DART.

- persistence: Contiene archivos que son utilizados en toda la aplicación.

- presentation: Contiene la interfaz de la aplicación (UI).

- repository: Contiene los archivos que se solicitan y reciben información de la API

# Acerca de la app:

La app se construyo desde una aproximación BloC, epecialmente para manejar la capa de red. (Network layer) 

Los "Blocs" se utilizan en las funciones principales de la app, cada funcionalidad tiene un "Bloc" diferente. 

Algunos de los archivos tienen comentarios clarificando algunos detalles. ¡Que disfrutes!
