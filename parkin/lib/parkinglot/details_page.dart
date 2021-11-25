import 'package:flutter/material.dart';

import 'package:parkin/models/parking.dart';
import 'package:parkin/ticket/ticket_page.dart';

class DetailsPageArguments {
  final Parking parking;

  DetailsPageArguments(this.parking);
}

class DetailsPage extends StatefulWidget {
  final Parking parking;

  const DetailsPage({Key? key, required this.parking}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    // final DetailsPageArguments arguments =
    //     ModalRoute.of(context)!.settings.arguments as DetailsPageArguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.parking.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  width: 240,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FlutterLogo(size: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                                'Número de vagas totais: ${widget.parking.total}',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                                'Número de vagas disponíveis:  ${widget.parking.available}',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'Tempo máximo de permanência: 2 Horas',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Insira a placa do seu veículo',
                            errorText: null,
                            suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Theme.of(context).primaryColor,
                                  size: 30,
                                ),
                                onPressed: () => 4)),
                        onSubmitted: (val) {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) => TicketPage(
                                    parking: Parking(
                                        id: 2,
                                        name: 'Cobal do leblon',
                                        available: 80,
                                        total: 130,
                                        outline: []),
                                    vehiclePlate: val,
                                  ));
                          Navigator.of(context).push((route));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
