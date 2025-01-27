import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadSelectedImage();
  }

  Future<void> _loadSelectedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedImage = prefs.getString('backgroundImage') ?? 'assets/default.jpg';
    });
  }

  Future<void> _saveSelectedImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImage', imagePath);
    setState(() {
      selectedImage = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Container(
        // Gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.withValues(alpha:0.3), Colors.white], 
          ),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text('Circuitos'),
              leading: Radio<String>(
                value: 'assets/circuitos.jpg',
                groupValue: selectedImage,
                onChanged: (value) {
                  if (value != null) {
                    _saveSelectedImage(value);
                  }
                },
              ),
            ),
            ListTile(
              title: Text('NubesRosas'),
              leading: Radio<String>(
                value: 'assets/nubesRosas.jpg',
                groupValue: selectedImage,
                onChanged: (value) {
                  if (value != null) {
                    _saveSelectedImage(value);
                  }
                },
              ),
            ),
            ListTile(
              title: Text('Flores Azules'),
              leading: Radio<String>(
                value: 'assets/flores_AZUL.jpg',
                groupValue: selectedImage,
                onChanged: (value) {
                  if (value != null) {
                    _saveSelectedImage(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
