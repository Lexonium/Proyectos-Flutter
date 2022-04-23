import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion;
  final peliculas = [
    'Pelicula 1',
    'Pelicula 2',
    'Pelicula 3',
    'Movie 1',
    'Movie 2',
    'Movie 3',
  ];

  final peliculasPopulares = [
    'Movie 1',
    'Movie 2',
    'Movie 3',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro app Bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            print('click action');
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izq del appBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          //print('leading icon pressed');
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Center(
        child: Container(
      height: 100,
      width: 100,
      color: Colors.blueAccent,
      child: Text(seleccion),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSugerida = (query.isEmpty)
        ? peliculasPopulares
        : peliculas
            .where((peli) => peli.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    // Crea las sugerencias
    return ListView.builder(
        itemCount: peliculasPopulares.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: () {
              seleccion = listaSugerida[i];
              showResults(context);
            },
          );
        });
  }
}
