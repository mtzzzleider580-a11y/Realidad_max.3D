// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa el paquete para usar la cámara y leer códigos QR
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

      // Cuerpo de la pantalla
      body: Column(
        children: [
          // Título informativo
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Apunta la cámara hacia un código QR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // La cámara ocupará el resto de la pantalla
          Expanded(
            child: MobileScanner(
              // Se ejecuta cuando detecta un código
              onDetect: (capture) {
                // Obtiene los códigos detectados
                final List<Barcode> barcodes = capture.barcodes;

                // Recorre los códigos encontrados
                for (final barcode in barcodes) {
                  // Verifica que tenga información
                  if (barcode.rawValue != null) {
                    // Muestra el contenido encontrado
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Código detectado: ${barcode.rawValue}',
                        ),
                      ),
                    );

                    // Sale del ciclo para evitar múltiples mensajes
                    break;
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}