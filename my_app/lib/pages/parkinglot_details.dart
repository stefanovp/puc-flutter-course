import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({@required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card No. $title'),
      ),
      body: Center(child: Text('Theres nothing here')),
    );
  }
}
