import 'package:componentes_clase/src/pages/animatedContainer_page.dart';
import 'package:componentes_clase/src/pages/lista_page.dart';
import 'package:componentes_clase/src/pages/sliders_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes_clase/src/pages/home_page.dart';
import 'package:componentes_clase/src/pages/alert_page.dart';
import 'package:componentes_clase/src/pages/avatar_page.dart';
import 'package:componentes_clase/src/pages/cards_page.dart';
import 'package:componentes_clase/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'sliders': (BuildContext context) => SliderPage(),
    'listas': (BuildContext context) => ListaPage()
  };
}
