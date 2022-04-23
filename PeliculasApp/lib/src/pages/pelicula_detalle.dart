import 'package:flutter/material.dart';
import 'package:peliculas_app/src/models/actor_model.dart';
import 'package:peliculas_app/src/models/pelicula_model.dart';
import 'package:peliculas_app/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatefulWidget {
  // const PeliculaDetalle({Key key}) : super(key: key);
  @override
  _PeliculaDetalleState createState() => _PeliculaDetalleState();
}

class _PeliculaDetalleState extends State<PeliculaDetalle> {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10.0),
            _posterTitulo(context, pelicula),
            _description(pelicula),
            _description(pelicula),
            _crearCasting(pelicula)
          ])),
        ],
      ),
    );
  }

  PeliculasProvider peliculasProvider = PeliculasProvider();

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(pelicula.title,
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackDropImg()),
          placeholder: AssetImage('assets/jar_loading.gif'),
          fadeOutDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(children: [
        Hero(
          tag: pelicula.uniqueId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(pelicula.getPosterImg()),
              height: 150.0,
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            pelicula.title,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
          ),
          Text(pelicula.originalTitle,
              style: Theme.of(context).textTheme.subtitle2,
              overflow: TextOverflow.ellipsis),
          Row(children: [
            Icon(Icons.star_border),
            Text(pelicula.voteAverage.toString(),
                style: Theme.of(context).textTheme.subtitle2,
                overflow: TextOverflow.ellipsis)
          ]),
        ]))
      ]),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    PeliculasProvider peliProvider = PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return _crearActoresPageView(snapshot.data);
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
          controller: PageController(initialPage: 1, viewportFraction: 0.3),
          itemCount: actores.length,
          itemBuilder: (context, i) {
            return _actorTarjeta(actores[i]);
          }),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/jar_loading.gif'),
              image: NetworkImage(actor.getPhoto()),
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
