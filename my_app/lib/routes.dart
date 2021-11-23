import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/pages/parkinglot_details.dart';
import 'package:my_app/pages/ticket.dart';
import 'package:my_app/pages/creditPage.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  DetailsPage.routeName: (context) => DetailsPage(),
  TicketPage.routeName: (context) => TicketPage(),
  CreditPage.routeName: (context) => CreditPage()
};
