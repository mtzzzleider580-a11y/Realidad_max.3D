// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa el paquete del escáner QR
import 'package:mobile_scanner/mobile_scanner.dart';

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
      body: Column(
        children: [
          // Texto informativo
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Prueba de integración del escáner",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Área donde más adelante veremos la cámara
          Expanded(
            child: Container(
              color: Colors.black12,

              child: const Center(
                child: Text(
                  "Aquí aparecerá la cámara",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}