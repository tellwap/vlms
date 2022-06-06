import 'package:flutter/material.dart';
import 'package:tvlms/screens/auth/login_screen.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text(
                          'Helps',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: const Text('call +255747343174'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                      const ListTile(
                        leading: Icon(Icons.verified_outlined),
                        title: Text(
                          'About App',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text('@VaccineMS V1.0.0'),
                        trailing: Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        leading: const Icon(Icons.login),
                        title: const Text(
                          'Admin Login',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: const Text('Admin Login'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                         Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   'Tellwap Inc',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
