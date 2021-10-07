import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/pages/parkinglot_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Estacionamento digital',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          '/details': (context) => DetailsPage(
                title: 'Missing title',
              )
        });
  }
}
