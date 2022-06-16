import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/providers/great_places.dart';
import 'package:tvlms/screens/search_screen.dart';

class MapTestScreen extends StatefulWidget {
  const MapTestScreen({Key? key}) : super(key: key);
  static const routeName = 'map-test-screen';

  @override
  _MapTestScreenState createState() => _MapTestScreenState();
}

class _MapTestScreenState extends State<MapTestScreen> {
  late GoogleMapController _controller;

  List<Marker> allMarkers = [];

  late PageController _pageController;

  late int prevPage;
  bool _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();
    fetchLocationApi();
    super.initState();

    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  fetchLocationApi() async {
    final response = await Provider.of<GreatPlaces>(context, listen: false)
        .fetchAndSetPlaces();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      // _getCurrentLocation();
      //fetchLocationApi();
      // _getCurrentUserLocation();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      // moveCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Centers'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _initializeMap,
          child: const Icon(Icons.refresh),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-6.7931429, 39.1672097),
                  zoom: 12.0,
                ),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  Future<LocationData> _getCurrentLocation() async {
    // try{
    final locData = await Location().getLocation();
    return locData;

    // } catch (error) {
    //   return  ;
    // }
  }

  void _initializeMap() async {
    final locationData = await _getCurrentLocation();
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(locationData.latitude as double,
                locationData.longitude as double),
            zoom: 12),
      ),
    );
    allMarkers.clear();

    //get all nearly marker from database
    addmarkers(locationData);

    setState(() {});
  }

  void addmarkers(LocationData locationData) {
    allMarkers.add(
      Marker(
          markerId: const MarkerId('my-current-location'),
          draggable: false,
          infoWindow: const InfoWindow(title: 'Me', snippet: 'Me'),
          position: LatLng(locationData.latitude as double,
              locationData.longitude as double),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)),
    );
    //get all markers
    final items = Provider.of<GreatPlaces>(context, listen: false).items;
    items.forEach((element) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow: InfoWindow(title: element.name, snippet: element.name),
          position:
              LatLng(element.location.latitude, element.location.longitude),
        ),
      );
    });
  }
}
