import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  double _valorInicial = 50.0;
  bool _isBloquedo = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Center(
        child: ListView(
          children: [
            _crearSlider(),
            Divider(),
            _crearCheckBox(),
            Divider(),
            _crearSwitch(),
            Divider(),
            _mostrarImagen(_valorInicial)
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorInicial,
      min: 1.0,
      max: 300.0,
      inactiveColor: Colors.blue[100],
      activeColor: Colors.blue,
      label: "Cambiar Tamaño Imagen",
      onChanged: _isBloquedo
          ? null
          : (_nuevoValor) {
              setState(() {
                _valorInicial = _nuevoValor;
              });
            },
      // onChanged: (double _nuevoValor) {
      //   setState(() {
      //     _valorInicial = _nuevoValor;
      //     //_mostrarImagen(_valorInicial);
      //   });
      // },
    );
  }

  Widget _mostrarImagen(double _valorInicial) {
    return FadeInImage(
      placeholder: AssetImage('assets/jar_loading.gif'),
      image: NetworkImage(
          'https://as.com/meristation/imagenes/2020/10/20/noticias/1603188013_994670_1603188063_noticia_normal_recorte1.jpg'),
      width: _valorInicial,
      height: _valorInicial,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear Imagen'),
        value: _isBloquedo,
        onChanged: (isChecked) {
          setState(() {
            _isBloquedo = isChecked;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Imagen'),
        value: _isBloquedo,
        onChanged: (isChecked) {
          setState(() {
            _isBloquedo = isChecked;
          });
        });
  }
}
