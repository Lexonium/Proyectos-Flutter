//importM
import 'package:flutter/material.dart';

//statelessW
class HomePageTemp extends StatelessWidget {
  //const HomePageTemp({Key key}) : super(key: key);
  final List<String> opciones = ['uno', 'dos', 'tres', 'cuatro', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Temp'),
      ),
      body: ListView(
        children: _crearOpciones2(),
      ),
    );
  }

  // List<Widget> _crearOpciones() {
  //   List<Widget> lista = new List<Widget>();

  //   for(String opt in opciones){
  //     final tempWidget = ListTile(title: Text(opt),
  //     )
  //     lista..add(tempWidget)
  //          ..add(Divider());
  //   }
  //   return lista;
  // }
  List<Widget> _crearOpciones2() {
    return opciones.map((opt) {
      return Column(
        children: [
          ListTile(title: Text(opt)),
          Divider(),
        ],
      );
    }).toList();
  }
}
