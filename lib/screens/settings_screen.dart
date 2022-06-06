import 'package:flutter/material.dart';
import 'package:tvlms/screens/auth/login_screen.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),),
      body: Column(children: [
        Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
            child: const Text('Admin login'),
          ),
        )
      ],),
    );
  }
}
