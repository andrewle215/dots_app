import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      initialCameraPosition: const CameraPosition(
        target: LatLng(38.9869, -76.9426),
        zoom: 11.0,
      ),
      markers: _markers,
      onTap: _handleTap,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }

  void _handleTap(LatLng point) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: const InfoWindow(
          title: 'Parking Spot',
          snippet: 'This is a parking spot',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    });
  }
}

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapSample(),
//     );
//   }
// }
//
// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }
//
// class MapSampleState extends State<MapSample> {
//   late GoogleMapController mapController;
//   late Marker marker;
//   late Polygon parkingArea;
//
// //  MapSampleState({required this.mapController, required this.marker, required this.parkingArea});
//
//   static const LatLng initialPosition = const LatLng(38.9974, 76.9320);
//   Set<Marker> markers = {};
//
//   // Define your hardcoded significant locations here
//   final List<Location> locations = [
//     Location(name: "Library", latitude: 38.9974, longitude: 76.9320),
//     // Add more locations as needed
//   ];
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//
//     // Create a marker for each location and add it to the markers set
//     for (final location in locations) {
//       final locationMarker = Marker(
//         markerId: MarkerId(location.name),
//         position: LatLng(location.latitude, location.longitude),
//         infoWindow: InfoWindow(
//           title: location.name,
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       );
//       markers.add(locationMarker);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// // Remaining code from the previous example...
//
// }
//
// class Location {
//   final String name;
//   final double latitude;
//   final double longitude;
//
//   Location(
//       {required this.name,required this.latitude,required this.longitude}
//       );
// }
