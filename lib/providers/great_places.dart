import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:tvlms/models/api_response.dart';
import 'package:tvlms/utils/constants.dart';

import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';
import 'package:http/http.dart' as http;

class GreatPlaces with ChangeNotifier {
  var _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(int id) {
    return _items.firstWhere((place) => place.id == id);
  }

  List<dynamic> filteredItems(int districtId) {
    final places = _items.where((place) => place.id == districtId).toList();
    print(places);
    _items = places;
    notifyListeners();
    return places;
  }

  //online
  Future<ApiResponse> fetchAndSetPlaces() async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $_token'
      };
      var uri = Uri.parse(placeURL);
      // if(categoryId != null) {
      //   uri = uri.replace(query: 'category_id=$categoryId');
      // }
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        print(response.body);

        _apiResponse.data = jsonDecode(response.body)
            .map((place) => Place.fromJson(place))
            .toList();
        _apiResponse.data as List<dynamic>;
        //update provider items
        _items = _apiResponse.data as List<dynamic>;
        notifyListeners();
      } else {
        _apiResponse.error = somethingWentWrong;
      }
    } catch (error) {
      print(error);
      _apiResponse.error = serverError;
    }
    return _apiResponse;
  }

  //subscription
  Future<ApiResponse> addPlace(
    String pickedTitle,
    // File pickedImage,
    Location location,
  ) async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      var uri = Uri.parse(placeURL);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $_token'
      };
      final response = await http.post(uri,
          body: jsonEncode({
            // 'user':13,
            'district_id': '1',
            'name': pickedTitle,
            'latitude': location.latitude,
            'longitude': location.longitude
          }),
          headers: headers);

      if (response.statusCode == 201) {
        print(response.body);
        // _apiResponse.data = jsonDecode(response.body)
        //     .map((quizSubscription) => QuizSubscription.fromJson(quizSubscription))
        //     .toList();
        // _apiResponse.data as List<dynamic>;
        //update provider items
        _items.add(Place.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        _apiResponse.error = somethingWentWrong;
      }
    } catch (error) {
      print(error);
      _apiResponse.error = serverError;
    }
    return _apiResponse;
  }
}
