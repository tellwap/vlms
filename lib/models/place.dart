import 'dart:io';

class Location {
  final double latitude;
  final double longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
    );
  }
}

class Place {
  final int id;
  final String name;
  final Location location;
  //final String latitude;
  //final String longitude;
  // final PlaceLocation location;
  // final File image;

  Place({required this.id, required this.name, required this.location
      //required this.latitude,
      // required this.longitude
      // required this.location,
      // required this.image,
      });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'],
        name: json['name'],
        location: Location.fromJson(json['location']));
    // latitude: json['latitude'] as String,
    // longitude: json['longitude'] as String);
  }
}
