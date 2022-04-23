import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_clase/pages/mapas_page.dart';
import 'package:qr_reader_clase/providers/scan_list_provider.dart';
import 'package:qr_reader_clase/providers/ui_provider.dart';
import 'package:qr_reader_clase/widgets/custom_navigation.dart';
import 'package:qr_reader_clase/widgets/scan_button.dart';
import 'package:qr_reader_clase/pages/direcciones_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              final scanLisProvider =
                  Provider.of<ScanListProvider>(context, listen: false);

              scanLisProvider.borrarTodos();
              // print('Eliminar todos');
            },
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    final currenIndex = uiProvider.selectedMenuOpt;

    // usar el scanlistProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    // TODO: Temporal solo para probar que existe
    // ScanModel tempScan = ScanModel(valor: 'http://cetys.mx');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(14).then((value) => print(value.valor));
    // DBProvider.db.getScans().then((values) => print(values.first.valor));
    // DBProvider.db.getScansPorTipo('http').then((values) => print(values.first.valor));
    // ScanModel tempScan = ScanModel(id: 14, valor: 'https://sorteos.cetys.mx/');
    // DBProvider.db.updateScan(tempScan).then((values) => print(values));
    // DBProvider.db.deleteAllScans();

    switch (currenIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
