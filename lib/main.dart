import 'package:flutter/material.dart';
import 'package:registro_formfield/pages/home.dart';
import 'package:registro_formfield/pages/menus.dart';
import 'package:registro_formfield/pages/registro.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home': (context) => Home(),
      '/registro': (context) => Registro(),
      '/menu': (context) => Menus()
    },
    initialRoute: '/home',
  ));
}
