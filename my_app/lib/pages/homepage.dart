import 'package:flutter/material.dart';
import 'package:my_app/models/location.dart';
import 'package:my_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<Location?> _location = API_Manager().getParkingLots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Center(
          child: Text('Estacionamento Digital'),
        ),
      ),
      body: Container(
        child: FutureBuilder<Location?>(
          future: _location,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  Parking parking = snapshot.data!.data[index];
                  return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const FlutterLogo(size: 48),
                                Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          parking.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                            'Vagas livres: ${parking.lat.toString()}'),
                                        Text(
                                            'Total de vagas: ${parking.long.toString()}')
                                      ],
                                    )),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/details',
                                        arguments: <String, String>{
                                          'title': index.toString()
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    size: 36,
                                  ),
                                )
                              ],
                            ),
                          )));
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('Failed to get parking lot data'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
