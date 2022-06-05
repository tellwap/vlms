import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/areas/views/areas_screen.dart';
import 'package:tvlms/providers/auths.dart';
import 'package:tvlms/screens/account_screen.dart';
import 'package:tvlms/screens/add_place_screen.dart';
import 'package:tvlms/screens/places_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const routeName = '/dashboard-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: Column(
          children: [
            Consumer<Auth>(
              builder: (ctx, auth, ch) => Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [Text('Welcome ${auth.user?.name}')],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AddPlaceScreen.routeName);
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: const [
                          Text(
                            'New Place',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Manage places'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PlacesListScreen.routeName);
                  },
                  child: Card(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: const [
                          Text(
                            'All Places',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Manage all places'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AreasScreen.routeName);
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: const [
                          Text(
                            'Add Area',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Manage Areas'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AccountScreen.routeName);
                  },
                  child: Card(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: const [
                          Text(
                            'My Accounts',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Manage Account'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
