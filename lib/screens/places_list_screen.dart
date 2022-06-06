import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/screens/auth/login_screen.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';
import './place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'place_list_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Center Location'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('Got no places yet, start adding some!'),
                    ),
                    builder: (ctx, greatPlaces, ch) => ListView.builder(
                      itemCount: greatPlaces.items.length,
                      itemBuilder: (ctx, i) => ListTile(
                        title: Text(
                          greatPlaces.items[i].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            'COORDINATE: ${greatPlaces.items[i].location.latitude}, ${greatPlaces.items[i].location.longitude}'),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            PlaceDetailScreen.routeName,
                            arguments: greatPlaces.items[i].id,
                          );
                        },
                      ),
                    ),
                  ),
      ),
    );
  }
}
