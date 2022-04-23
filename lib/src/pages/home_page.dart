import 'package:componentes_clase/src/pages/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes_clase/src/providers/menu_providers.dart';
import 'package:componentes_clase/src/utils/icons_string_utils.dart';

//import 'package:componentes/src/utils/icons_string_utils.dart';

// statelessW
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    // menuProvider.cargarData()

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print('builder');
        print(snapshot.data);

        return ListView(
          children: _crearItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearItems(List<dynamic> data, BuildContext contexto) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) {
          //   return AlertPage();
          // });
          // Navigator.push(context, route);
          Navigator.pushNamed(contexto, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
