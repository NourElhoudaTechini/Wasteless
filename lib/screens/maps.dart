import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CleanUpMapScreen extends StatefulWidget {
  const CleanUpMapScreen({super.key});

  @override
  State<CleanUpMapScreen> createState() => _CleanUpMapScreenState();
}

class _CleanUpMapScreenState extends State<CleanUpMapScreen> {
  GoogleMapController? mapController;

  void _openGoogleMaps() async {
    final String googleUrl =
        "https://www.google.com/maps/dir/?api=1&destination=36.8008,10.1844";

    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl),
          mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Clean',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(36.8008, 10.1844),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                mapController = controller;
              });
            },
            markers: {
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(36.8008, 10.1844),
                infoWindow: InfoWindow(
                  title: 'Dirty Place',
                  snippet: 'This place is dirty',
                ),
              ),
            },
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'Where to find?',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  'Finding place...',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(height: 4),
                Text(
                  'Nearby dirty places',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _openGoogleMaps,
              child: const Text(
                'Directions',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
