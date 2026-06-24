// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Pantalla del escáner
class ScannerScreen extends StatelessWidget {
  // Constructor
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text("Escanear Marcadores"),
        centerTitle: true,
      ),

      // Contenido principal
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Icono representativo
            const Icon(
              Icons.qr_code_scanner,
              size: 120,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            // Título
            const Text(
              "Escáner de Marcadores",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Descripción
            const Text(
              "Aquí se abrirá la cámara para reconocer marcadores.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}