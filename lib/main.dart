import 'package:componentes_clase/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes_clase/src/pages/alert_page.dart';
import 'package:componentes_clase/src/pages/avatar_page.dart';
import 'package:componentes_clase/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', 'ES'),
        const Locale.fromSubtags(
            languageCode: 'zh'), // Chinese *See Advanced Locales below*
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (settings) {
        print('Ruta Desconocida llamada en "${settings.name}"');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
