import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/components/autocomplete.dart';
import 'package:tvlms/providers/great_places.dart';

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({Key? key}) : super(key: key);

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation =
      const LatLng(27.7089427, 85.3086209); //location to show in map
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Vacination center'),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: showLocation, //initial position
              zoom: 15.0, //initial zoom level
            ),
            markers: getmarkers(), //markers to show on map
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: AutocompleteBasicUserExample(),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    final places = Provider.of<GreatPlaces>(context).items;
    print('*********** $places');
    setState(() {
      print('refresh map');
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(
          27.7089427,
          85.3086209,
        ), //position of marker

        infoWindow: const InfoWindow(
          //popup info
          title: 'You',
          snippet: 'You',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen), //Icon for Marker
      ));
    });

    for (var place in places) {
      print(place);
      setState(() {
        markers.add(Marker(
          //add first marker
          markerId: MarkerId(showLocation.toString()),
          position: LatLng(
            place.location.latitude,
            place.location.longitude,
          ), //position of marker

          infoWindow: InfoWindow(
            //popup info
            title: place.name,
            snippet: place.name,
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      });
    }

    return markers;
  }
}
