// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Pantalla de información
class InfoScreen extends StatelessWidget {
  // Constructor
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text("Información"),
        centerTitle: true,
      ),

      // Contenido principal
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Título principal
            const Center(
              child: Icon(
                Icons.school,
                size: 100,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Información del Ambiente",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tarjeta con la información
            Card(
              elevation: 5,

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Ambiente: SISTEMAS",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Ficha: 3067861",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Programa: ADSO-Analisis y desarrollo de Software-gen-2024",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Horario: 6:00 AM - 12:00 PM",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Instructores: Mara Cabrales, Maristela Perez, Ronald Ching",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}