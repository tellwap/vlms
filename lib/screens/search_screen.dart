import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvlms/areas/models/area.dart';
import 'package:tvlms/screens/map_search_screen.dart';
import 'package:tvlms/screens/map_test_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<Area> {
  final districts = [
    Area(id: 1, name: 'Kijitonyama', code: 'T1234'),
    Area(id: 2, name: 'Ilala', code: 'T1864'),
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, Area(id: 0, name: '', code: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugestedDistricts = districts
        .where((district) =>
            district.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: sugestedDistricts.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: const Icon(Icons.location_city),
        title: Text(
          sugestedDistricts[index].name,
        ),
        onTap: () {
          print(sugestedDistricts[index]);
          // Navigator.pushNamed(context, MapSearchScreen.routeName,
          //     arguments: sugestedDistricts[index]);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) =>
                    MapSearchScreen(area: sugestedDistricts[index]),
              ));
          //showResults(context);
        },
      ),
    );
  }
}
