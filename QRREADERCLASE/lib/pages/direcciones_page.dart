import 'package:flutter/material.dart';
import 'package:qr_reader_clase/widgets/scan_tile.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
