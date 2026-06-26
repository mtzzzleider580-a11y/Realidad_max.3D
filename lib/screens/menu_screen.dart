// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa la pantalla de créditos
import 'credits_screen.dart';
// Importa la pantalla de información
import 'info_screen.dart';
// importa la pantalla del escáner
import 'scanner_screen.dart';

// Pantalla principal del menú
class MenuScreen extends StatelessWidget {
  // Constructor
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text("Menú Principal"),
        centerTitle: true,
      ),

      // Contenido principal
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // Título principal
            const Text(
              "Seleccione una opción",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Espacio vertical
            const SizedBox(height: 30),

            // ==========================
            // TARJETA ESCANEAR
            // ==========================
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                  color: Colors.green,
                ),

                title: const Text(
                  "Escanear Marcadores",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  "Reconocer imágenes y códigos QR",
                ),

                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ScannerScreen(),
    ),
  );
},
              ),
            ),

            // Espacio vertical
            const SizedBox(height: 15),

           // ==========================
// TARJETA INFORMACIÓN
// ==========================
Card(
  elevation: 5,
  child: ListTile(
    leading: const Icon(
      Icons.info,
      size: 40,
      color: Colors.blue,
    ),

    title: const Text(
      "Información",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),

    subtitle: const Text(
      "Descripción del proyecto",
    ),

    trailing: const Icon(Icons.arrow_forward_ios),

    // Navega hacia la pantalla de información
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InfoScreen(),
        ),
      );
    },
  ),
),
            // Espacio vertical
            const SizedBox(height: 15),

            // ==========================
            // TARJETA CRÉDITOS
            // ==========================
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.people,
                  size: 40,
                  color: Colors.orange,
                ),

                title: const Text(
                  "Créditos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  "Autores del proyecto",
                ),

                trailing: const Icon(Icons.arrow_forward_ios),

                // Navega a la pantalla de créditos
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreditsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}