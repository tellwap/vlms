import 'package:flutter/material.dart';
import 'package:tvlms/screens/locations_map_screen.dart';
import 'package:tvlms/screens/places_list_screen.dart';
import 'package:tvlms/screens/settings_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);
  static const routeName = '/bottom-navigation_screen';

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  List<Widget> pages = [const LocationMapScreen(), const SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        onTap: (selected) {
          setState(() {
            _currentIndex = selected;
          });
        },
        currentIndex: _currentIndex,
        items: [
         // BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Centers'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),


        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
