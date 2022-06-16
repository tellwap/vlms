import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/areas/models/area.dart';
import 'package:tvlms/areas/view_models/area_view_model.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/great_places.dart';
import '../models/place.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  // File? _pickedImage;
  Location? _pickedLocation;

  // void _selectImage(File pickedImage) {
  //   _pickedImage = pickedImage;
  // }

  Area? _selectedArea;
  bool _isInit = false;

  void _selectPlace(double lat, double lng) {
    _pickedLocation = Location(latitude: lat, longitude: lng);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedLocation == null ||
        _selectedArea == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Required filled is missing')));
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedLocation!, _selectedArea!.id);
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() async {
    // if (_isInit) {
    //   return;
    // }
    // await Provider.of<AreaViewModel>(context, listen: false).getAreas();
    // _isInit = true;
    print('initiated.......');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _areas = Provider.of<AreaViewModel>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<Area>(
                      decoration:
                          const InputDecoration(label: Text('District')),
                      value: _selectedArea,
                      items: _areas
                          .map(
                            (district) => DropdownMenuItem<Area>(
                              value: district,
                              child: Text(district.name),
                            ),
                          )
                          .toList(),
                      onChanged: (selectedArea) {
                        setState(() {
                          _selectedArea = selectedArea;
                          //  _selectedUnitId = selectedUnit.id;
                        });
                      },
                      validator: (val) =>
                          val == null ? 'Unit is  is required' : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
