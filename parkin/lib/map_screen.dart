import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkin/models/parking.dart';
import 'package:parkin/parkinglot/details_page.dart';
import 'package:parkin/profile/profile_page.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MapScreen());
  }

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-22.9797, -43.2334), zoom: 15);

  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Parkin'),
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.of(context).push(ProfilePage.route()),
          ),
          actions: [
            IconButton(
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(_initialCameraPosition)),
                icon: Icon(Icons.attach_money)),
          ],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            Marker(
              markerId: MarkerId('Parque dos patins'),
              infoWindow: InfoWindow(title: "42"),
              position: LatLng(-22.97186, -43.21660),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => DetailsPage(
                        parking: Parking(
                            id: 1,
                            name: 'Parque dos patins',
                            available: 35,
                            total: 42,
                            outline: [])));
                Navigator.of(context).push((route));
              },
            ),
            Marker(
              markerId: MarkerId('Cobal do leblon'),
              infoWindow: InfoWindow(title: "42"),
              position: LatLng(-22.97975, -43.22122),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => DetailsPage(
                        parking: Parking(
                            id: 2,
                            name: 'Cobal do leblon',
                            available: 80,
                            total: 130,
                            outline: [])));
                Navigator.of(context).push((route));
              },
            ),
            Marker(
              markerId: MarkerId('Baixo Gávea'),
              infoWindow: InfoWindow(title: "42"),
              position: LatLng(-22.97363, -43.22712),
              onTap: () {
                var route = MaterialPageRoute(
                    builder: (BuildContext context) => DetailsPage(
                        parking: Parking(
                            id: 3,
                            name: 'Baixo Gávea',
                            available: 20,
                            total: 78,
                            outline: [])));
                Navigator.of(context).push((route));
              },
            )
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition)),
          child: const Icon(Icons.center_focus_strong),
        ));
  }
}
