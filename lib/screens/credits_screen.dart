// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Pantalla de créditos
class CreditsScreen extends StatelessWidget {
  // Constructor
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text("Créditos"),
        centerTitle: true,
      ),

      // Contenido principal
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // Icono representativo del equipo
              const Icon(
                Icons.people,
                size: 100,
                color: Colors.orange,
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Título principal
              const Text(
                "Proyecto de Realidad Aumentada",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Texto descriptivo
              const Text(
                "Desarrollado por:",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Integrante 1
              const Text(
                "Leider Maza Taboada",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Integrante 2
              const Text(
                "Leider Manuel Díaz Carrillo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Integrante 3
              const Text(
                "Jhorman Alejandro Vera",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Programa académico
              const Text(
                "Análisis y Desarrollo de Software",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}