import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Background App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/info': (context) => InfoScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información Personal de la estudiante'),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nombre: Mónica Sofía Restrepo León',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Correo: morestrepol@unal.edu.co',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Edad: 22 años',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
