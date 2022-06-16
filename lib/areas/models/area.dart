import 'package:flutter/widgets.dart';
import 'package:tvlms/models/place.dart';

class Area {
  final int id;
  final String name;
  final String code;
  List<Place>? places;

  Area({
    required this.id,
    required this.name,
    required this.code,
    this.places,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    var list = json['centers'] as List;
    var centerList =
        list.map((orderItem) => Place.fromJson(orderItem)).toList();
    return Area(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        places: centerList);
  }
}
