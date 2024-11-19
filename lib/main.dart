import 'package:flutter/material.dart';
import 'package:registro_formfield/pages/home.dart';
import 'package:registro_formfield/pages/registro.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home': (context) => Home(),
      '/registro': (context) => Registro()
    },
    initialRoute: '/home',
  ));
}
