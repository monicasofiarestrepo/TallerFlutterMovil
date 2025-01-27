import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? backgroundImage;

  @override
  void initState() {
    super.initState();
    _loadBackgroundImage();
  }

  Future<void> _loadBackgroundImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      backgroundImage = prefs.getString('backgroundImage') ?? 'assets/circuitos.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (backgroundImage != null)
            Image.asset(
              backgroundImage!,
              fit: BoxFit.cover,
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
              const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/info',
                      arguments: {
                        'name': 'Mónica Sofía Restrepo León',
                        'email': 'morestrepol@unal.edu.co',
                        'age': '22 años',
                      },
                    );
                  },
                  child: Text('Ver información de estudiante'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings').then((_) {
                      _loadBackgroundImage();
                    });
                  },
                  child: Text('Abrir Configuración de imagenes'),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
