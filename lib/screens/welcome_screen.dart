// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa la pantalla del menú principal
import 'menu_screen.dart';

// Pantalla de bienvenida de la aplicación
class WelcomeScreen extends StatelessWidget {
  // Constructor de la clase
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color de fondo de la pantalla
      backgroundColor: Colors.green[25],

      // Cuerpo principal de la pantalla
      body: Center(
        child: Padding(
          // Espaciado interno de toda la pantalla
          padding: const EdgeInsets.all(20),

          // Organiza los elementos verticalmente
          child: Column(
            // Centra los elementos verticalmente
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // Icono relacionado con Realidad Aumentada
              const Icon(
                Icons.view_in_ar,
                size: 120,
                color: Colors.green,
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Título principal de la aplicación
              const Text(
                "Proyecto de\nRealidad Aumentada",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Espacio vertical
              const SizedBox(height: 20),

              // Descripción breve del proyecto
              const Text(
                "Explora contenido interactivo mediante marcadores, modelos 3D, información dinámica y videos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              // Espacio vertical
              const SizedBox(height: 40),

              // Contenedor para controlar el tamaño del botón
              SizedBox(
                width: 220,
                height: 50,

                child: ElevatedButton(
                  // Acción al presionar el botón
                  onPressed: () {
                    // Navega a la pantalla de menú
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuScreen(),
                      ),
                    );
                  },

                  // Texto mostrado en el botón
                  child: const Text(
                    "Iniciar",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}