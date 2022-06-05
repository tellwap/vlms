import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvlms/areas/view_models/area_view_model.dart';
import 'package:tvlms/areas/views/add_area_screen.dart';
import 'package:tvlms/areas/views/area_details_screen.dart';
import 'package:tvlms/areas/views/areas_screen.dart';
import 'package:tvlms/areas/views/edit_area_screen.dart';
import 'package:tvlms/providers/auths.dart';
import 'package:tvlms/providers/great_places.dart';
import 'package:tvlms/screens/account_screen.dart';
import 'package:tvlms/screens/add_place_screen.dart';
import 'package:tvlms/screens/auth/login_screen.dart';
import 'package:tvlms/screens/auth/register_screen.dart';
import 'package:tvlms/screens/bottom_navigation_screen.dart';
import 'package:tvlms/screens/dashboard_screen.dart';
import 'package:tvlms/screens/place_detail_screen.dart';
import 'package:tvlms/screens/places_list_screen.dart';
import 'package:tvlms/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const MaterialColor navy = MaterialColor(
    0xFF101D3D,
    <int, Color>{
      50: Color(0xFF101D3D),
      100: Color(0xFF101D3D),
      200: Color(0xFF101D3D),
      300: Color(0xFF101D3D),
      400: Color(0xFF101D3D),
      500: Color(0xFF101D3D),
      600: Color(0xFF101D3D),
      700: Color(0xFF101D3D),
      800: Color(0xFF101D3D),
      900: Color(0xFF101D3D),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProvider(create: (ctx) => GreatPlaces()),
        ChangeNotifierProvider(create: (ctx) => AreaViewModel()),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, ch) => MaterialApp(
            title: 'VCP',
            theme: ThemeData(
              primarySwatch: navy,
              accentColor: Colors.amber,
            ),
            home: auth.isAuth
                ? const DashboardScreen()
                : FutureBuilder<Object>(
                    future: auth.tryAutoLogin(),
                    builder: (context, authSnapshot) =>
                        authSnapshot.connectionState == ConnectionState.waiting
                            ? const SplashScreen()
                            : const BottomNavigationScreen()),
            routes: {
              AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
              PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              RegisterScreen.routeName: (ctx) => const RegisterScreen(),
              PlacesListScreen.routeName: (ctx) => PlacesListScreen(),
              BottomNavigationScreen.routeName: (ctx) =>
                  const BottomNavigationScreen(),
              AccountScreen.routeName: (ctx) => AccountScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              DashboardScreen.routeName: (ctx) => DashboardScreen(),

              //Areas
              AreasScreen.routeName: (ctx) => const AreasScreen(),
              AddAreaScreen.routeName: (ctx) => const AddAreaScreen(),
              EditAreaScreen.routeName: (ctx) => const EditAreaScreen(),
              AreaDetailsScreen.routeName: (ctx) => const AreaDetailsScreen(),
            }),
      ),
    );
  }
}
