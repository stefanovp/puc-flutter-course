import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Estacionamento digital',
        theme: ThemeData(
            primarySwatch: Colors.purple, backgroundColor: Color(0xFFF5F6F9)),
        home: const HomePage(),
        routes: routes);
  }
}
