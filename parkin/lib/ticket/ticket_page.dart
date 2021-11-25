import 'package:flutter/material.dart';
import 'package:parkin/database/database.dart';
import 'package:parkin/models/models.dart';
import 'package:parkin/models/parking.dart';

class TicketPageArguments {
  final String parkingName;
  final String vehiclePlate;

  TicketPageArguments(this.parkingName, this.vehiclePlate);
}

class TicketPage extends StatefulWidget {
  final Parking parking;
  final String vehiclePlate;
  const TicketPage(
      {Key? key, required this.parking, required this.vehiclePlate})
      : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    // final TicketPageArguments arguments =
    //     ModalRoute.of(context)!.settings.arguments as TicketPageArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo ticket'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Seu novo ticket',
                        style: Theme.of(context).textTheme.headline4),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: FlutterLogo(
                        size: 100,
                      ),
                    ),
                    Text('Id: FASDjlkjl12kAWDldk780AJDK45'),
                    Container(
                      padding: EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Text('Estacionamento: ${widget.parking.name}'),
                          Text('Veículo: ${widget.vehiclePlate}}'),
                          Text('Permanencia máxima: 2 Horas')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    addTicket(),
                    Navigator.popUntil(context, (route) => route.isFirst)
                  },
              child: Text('Pague para poder estacionar'))
        ],
      ),
    );
  }

  Future addTicket() async {
    final note = Ticket(
        parkingName: widget.parking.name, vehiclePlate: widget.vehiclePlate);

    await TicketsDatabase.instance.create(note);
  }
}
