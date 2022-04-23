import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_clase/pages/home_page.dart';
import 'package:qr_reader_clase/pages/login_page.dart';
import 'package:qr_reader_clase/pages/mapa_page.dart';
import 'package:qr_reader_clase/providers/scan_list_provider.dart';
import 'package:qr_reader_clase/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Reader',
          initialRoute: 'login',
          routes: {
            'home': (_) => HomePage(),
            'mapa': (_) => MapaPage(),
            'login': (_) => LoginPage(),
          },
          theme: ThemeData(
              primaryColor: Colors.deepPurple,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple))),
    );
  }
}

//PROYECTO PANTALLAS
//INICIO LOGIN PARA VER SI ES EMPLEADO O CLIENTE
//CLIENTE PAGINA PRINCIPAL MENU DE LISTTILES CON COMIDA< CON UNA NAVIGATION BAR PARA VER SUS ORDENES Y SU PERFIL
//EMPLEADO PAGINA PRINCIPAL CON MENU DE ORDENES ACTIVAS, CON NAVIGATION BAR PARA AGREGAR ORDENES
