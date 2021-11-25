import 'package:flutter/material.dart';
import 'package:parkin/database/database.dart';
import 'package:parkin/models/models.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tickets')),
      body: const TicketsWidget(),
    );
  }
}

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  late List<Ticket> tickets;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshTickets();
  }

  Future refreshTickets() async {
    setState(() => isLoading = true);

    this.tickets = await TicketsDatabase.instance.readAllTickets();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? CircularProgressIndicator()
          : tickets.isEmpty
              ? const Center(
                  child: Text(
                    'No Notes',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                )
              : buildTickets(),
    );
  }

  Widget buildTickets() => ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          Ticket ticket = tickets[index];
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ticket.id.toString()),
                  Text('Local: ${ticket.parkingName}'),
                  Text('Veiculo: ${ticket.vehiclePlate}')
                ],
              ),
            ),
          );
        },
      );
}
