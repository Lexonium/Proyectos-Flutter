import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tarjetas'),
        ),
        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: [_cargarTarjeta1(), _cargarTarjeta2()],
        ));
  }

  Widget _cargarTarjeta1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el Titulo'),
            subtitle: Text(
                'Subtitulo con mucho texto yeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeet'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cargarTarjeta2() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar_loading.gif'),
            image: NetworkImage(
                'https://hipertextual.com/files/2020/07/hipertextual-the-mandalorian-ampliara-su-universo-traves-comics-y-novelas-2020844639-scaled.jpg'),
          ),
          Text('La Imagen')
        ],
      ),
    );
  }
}
