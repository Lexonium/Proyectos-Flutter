import 'package:flutter/material.dart';
import 'package:productos_clase/models/producto_model.dart';
import 'package:productos_clase/providers/productos_provider.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductosProvider productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto')
          .then((value) => setState(() {})),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<ProductoModel> productos = snapshot.data;

        return ListView.builder(
          itemCount: productos.length,
          itemBuilder: (context, i) => _crearItem(context, productos[i]),
        );
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel prod) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        productosProvider.eliminarProducto(prod.id);
      },
      child: Card(
        child: Column(
          children: [
            (prod.fotoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(prod.fotoUrl),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text('${prod.titulo} - ${prod.precio}'),
              subtitle: Text('${prod.id}'),
              onTap: () =>
                  Navigator.pushNamed(context, 'producto', arguments: prod)
                      .then((value) => setState(() {})),
            ),
          ],
        ),
      ),
    );
  }
}
//HOMEPAGE en ListView manera de eliminar el producto envolver ListTile en Dismissable, y crear en productoprovider crear funcion eliminar producto
//Crear modificar producto (es un http.put) en producto_page
