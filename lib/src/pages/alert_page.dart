import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alertas'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Mostrar Alerta'),
            onPressed: () => _mostrarAlerta(context),
            shape: StadiumBorder(),
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ));
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Este es el texto del contenido de la alerta'),
                FlutterLogo(
                  size: 100.00,
                )
              ],
            ),
            actions: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok')),
            ],
          );
        });
  }
}
