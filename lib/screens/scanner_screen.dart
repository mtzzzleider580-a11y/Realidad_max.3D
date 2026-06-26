// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa el paquete para usar la cámara y leer códigos QR
import 'package:mobile_scanner/mobile_scanner.dart';

// Importa la pantalla de información
import 'info_screen.dart';

// ======================================================================
// PANTALLA DEL ESCÁNER
// Se utiliza StatefulWidget porque necesitamos guardar el estado de
// si ya se leyó un código QR para evitar múltiples lecturas.
// ======================================================================
class ScannerScreen extends StatefulWidget {
  // Constructor
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  // Variable que indica si ya se leyó un QR
  bool _escaneoRealizado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text("Escanear Marcadores"),
        centerTitle: true,
      ),

      // Cuerpo principal
      body: Column(
        children: [
          // Texto informativo
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

          // La cámara ocupa el resto de la pantalla
          Expanded(
            child: MobileScanner(

              // Se ejecuta cuando detecta un código QR
              onDetect: (capture) {

                // Si ya se procesó un QR, no hace nada
                if (_escaneoRealizado) return;

                // Marca que ya se realizó un escaneo
                _escaneoRealizado = true;

                // Obtiene los códigos detectados
                final List<Barcode> barcodes = capture.barcodes;

                // Recorre los códigos encontrados
                for (final barcode in barcodes) {

                  // Verifica que el QR tenga información
                  if (barcode.rawValue != null) {

                    // Obtiene el contenido del QR
                    String codigo = barcode.rawValue!.trim();

                    // Muestra el contenido en la consola
                    debugPrint("QR leído: '$codigo'");

                    // Si el QR corresponde a la información
                    if (codigo.toUpperCase() == "INFO_SENA") {

                      // Navega a la pantalla de información
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoScreen(),
                        ),
                      ).then((_) {
                        // Cuando el usuario regrese, permite escanear nuevamente
                        _escaneoRealizado = false;
                      });

                    } else {

                      // Si el QR no es reconocido, muestra su contenido
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Código detectado: $codigo",
                          ),
                        ),
                      );

                      // Permite volver a escanear
                      _escaneoRealizado = false;
                    }

                    // Sale del ciclo
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