import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'info_screen.dart';

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
        '/info': (context) => InfoScreen(
              name: (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>)['name'] ?? '',
              email: (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>)['email'] ?? '',
              age: (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>)['age'] ?? '',
            ),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}