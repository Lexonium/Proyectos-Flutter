import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  // Ojo se cambio a regresar un future, para que nos regrese hasta que ya se carga
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    // print(dataMap);

    // // OJO realizar un hot restart
    // print(dataMap['nombreApp']);
    // print(dataMap['rutas']);

    opciones = dataMap['rutas'];

    return opciones;
  }
}

// solo se expone la instancia
final menuProvider = new _MenuProvider();
