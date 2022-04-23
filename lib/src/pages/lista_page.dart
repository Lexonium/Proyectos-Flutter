import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  // ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // Se esta creando cada que entramos
  ScrollController _scrollController = new ScrollController();

  List<int> _enteros = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    // cada que se mueve scroll
    // OJO (hot restart)
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    // https://picsum.photos/

    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _enteros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _enteros[index];

            return FadeInImage(
              placeholder: AssetImage('assets/jar_loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/400?random=$imagen'),
            );
          }),
    );
  }

  Future<void> _obtenerPagina1() async {
    Duration duration = Duration(seconds: 2);
    new Timer(duration, () {
      _enteros.clear();
      _ultimoNumero++; // nuevas imagenes
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i <= 10; i++) {
      _ultimoNumero++;
      _enteros.add(_ultimoNumero);
    }

    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    Duration duration = Duration(seconds: 2);
    return new Timer(duration, _respuestaHttp);
  }

  void _respuestaHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(microseconds: 250),
    );

    setState(() {});

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()]),
          SizedBox(height: 15.0),
        ],
      );
    }

    return Container();
  }
}
