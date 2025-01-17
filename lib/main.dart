import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
      State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: {
              const Marker(
                markerId: const MarkerId("Sydney"),
                position: LatLng(-33.86, 151.20),
                infoWindow: InfoWindow(
                  title: "Sydney",
                  snippet: "Capital of New South Wales",
                ), // InfoWindow
              ), //Marker
            },
          ),
      ),
    );
  }
}