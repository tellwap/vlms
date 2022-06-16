import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/areas/models/area.dart';
import 'package:tvlms/providers/great_places.dart';

class AutoComplete extends StatelessWidget {
  const AutoComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Autocomplete Basic User'),
        ),
        body: const Center(
          child: AutocompleteBasicUserExample(),
        ),
      ),
    );
  }
}

@immutable
class User {
  const User({
    required this.email,
    required this.name,
  });

  final String email;
  final String name;

  @override
  String toString() {
    return '$name, $email';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => Object.hash(email, name);
}

class AutocompleteBasicUserExample extends StatelessWidget {
  const AutocompleteBasicUserExample({Key? key}) : super(key: key);

  static List<Area> _areaOptions = <Area>[
    Area(id: 1, name: 'Kijitonyama', code: 'T345'),
    Area(id: 2, name: 'Kinondoni', code: 'T3455'),
    Area(id: 3, name: 'Kigamboni', code: 'T3435'),
    Area(id: 4, name: 'Changanyikeni', code: 'T8345'),
  ];

  static String _displayStringForOption(Area option) => option.name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Autocomplete<Area>(
        displayStringForOption: _displayStringForOption,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<Area>.empty();
          }
          return _areaOptions.where((Area option) {
            return option.name
                .toString()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (Area selection) {
          Provider.of<GreatPlaces>(context, listen: false).filteredItems(1);
          debugPrint('You just selected ${_displayStringForOption(selection)}');
        },
      ),
    );
  }
}
