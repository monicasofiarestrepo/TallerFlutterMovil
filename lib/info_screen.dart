import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final String name;
  final String email;
  final String age;

  const InfoScreen({
    super.key,
    required this.name,
    required this.email,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la estudiante: '),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.withValues(alpha: 0.7), Colors.purple.withValues(alpha: 0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Nombre: $name',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Correo: $email',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Edad: $age',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
