import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';
import './map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.name),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Name of place',
                      ),
                      Text(
                        selectedPlace.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latitude',
                      ),
                      Text(
                        selectedPlace.location.latitude.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Longitude',
                      ),
                      Text(
                        selectedPlace.location.longitude.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            FlatButton(
              child: Text('View on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(
                      // initialLocation: selectedPlace.location,
                      isSelecting: false,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
