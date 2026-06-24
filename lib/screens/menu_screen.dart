import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Aquí irán las opciones de Realidad Aumentada",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}