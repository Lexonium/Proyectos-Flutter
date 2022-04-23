import 'package:flutter/material.dart';
import 'package:productos_clase/pages/home_page.dart';
import 'package:productos_clase/pages/producto_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => HomePage(), 'producto': (_) => ProductoPage()},
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}
//CLOUDINARY ASSIGNED NAME: du286j6us/ApreynosoFlutterCloud
