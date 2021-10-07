import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Estacionamento digital',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const HomePage());
  }
}

class ParkingList extends StatefulWidget {
  @override
  ParkingListState createState() => ParkingListState();
}

class ParkingListState extends State<ParkingList> {
  final int _listCount = 0;

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(child: Text('Entry ${index}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Estacionamento digital'),
        ),
        body: _buildList());
  }
}
