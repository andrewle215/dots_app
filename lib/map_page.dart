import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MyApp(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController mapController;
  late Marker marker;
  late Polygon parkingArea;
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

//  MapSampleState({required this.mapController, required this.marker, required this.parkingArea});

  static const LatLng initialPosition = const LatLng(38.9974, 76.9320);
  Set<Marker> markers = {};

  // Define your hardcoded significant locations here
  final List<Location> locations = [
    Location(name: "Library", latitude: 38.9974, longitude: 76.9320),
    // Add more locations as needed
  ];

  void _onMapCreated(GoogleMapController controller) {}

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;

        // Create a marker for each location and add it to the markers set
        for (final location in locations) {
          final locationMarker = Marker(
            markerId: MarkerId(location.name),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(
              title: location.name,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          );
          markers.add(locationMarker);
        }
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(38.9869, -76.9426),
        zoom: 11.0,
      ),
      // markers: _markers,
      // onTap: _handleTap,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

// Remaining code from the previous example...
}

class Location {
  final String name;
  final double latitude;
  final double longitude;

  Location(
      {required this.name, required this.latitude, required this.longitude});
}

