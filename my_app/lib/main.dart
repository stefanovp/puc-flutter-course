import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/routes.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
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

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
