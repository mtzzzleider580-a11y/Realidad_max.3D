// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa el paquete para usar la cámara y leer códigos QR
import 'package:mobile_scanner/mobile_scanner.dart';

// Importa la pantalla de información
import 'info_screen.dart';

// Importa la pantalla de video
import 'video_screen.dart';

// Importa el servicio que administra los códigos QR
import '../services/qr_service.dart';

// ======================================================================
// PANTALLA DEL ESCÁNER
//
// Se utiliza StatefulWidget porque necesitamos guardar información
// mientras la pantalla está abierta, por ejemplo si ya se leyó un QR.
// ======================================================================
class ScannerScreen extends StatefulWidget {
  // Constructor
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  // Variable que evita leer el mismo QR muchas veces seguidas
  bool _escaneoRealizado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior de la pantalla
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
              // Se ejecuta automáticamente cuando detecta un código QR
              onDetect: (capture) {
                // Si ya se procesó un código, no vuelve a leer otro
                if (_escaneoRealizado) return;

                // Bloquea nuevas lecturas
                _escaneoRealizado = true;

                // Obtiene todos los códigos detectados
                final List<Barcode> barcodes = capture.barcodes;

                // Recorre todos los códigos encontrados
                for (final barcode in barcodes) {
                  // Verifica que el QR tenga información
                  if (barcode.rawValue != null) {
                    // Obtiene el texto del QR eliminando espacios
                    String codigo = barcode.rawValue!.trim();

                    // Muestra el contenido en la consola
                    debugPrint("QR leído: '$codigo'");

                    // Consulta al servicio cuál es la acción correspondiente
                    String accion = QRService.obtenerAccion(codigo);


                    // Muestra la acción devuelta por el servicio
                    debugPrint("Acción devuelta: '$accion'");

                    // =====================================================
                    // ACCIÓN: ABRIR INFORMACIÓN
                    // =====================================================
                    if (accion == "INFO") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoScreen(),
                        ),
                      ).then((_) {
                        // Permite volver a escanear cuando el usuario regrese
                        _escaneoRealizado = false;
                      });
                    }

                    // =====================================================
                    // ACCIÓN: ABRIR VIDEO
                    // =====================================================
                    else if (accion == "VIDEO") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoScreen(),
                        ),
                      ).then((_) {
                        // Permite volver a escanear cuando el usuario regrese
                        _escaneoRealizado = false;
                      });
                    }

                    // =====================================================
                    // ACCIÓN: QR DESCONOCIDO
                    // =====================================================
                    else {
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

                    // Sale del ciclo para evitar procesar más códigos
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