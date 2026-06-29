// ======================================================================
// SERVICIO PARA ADMINISTRAR LOS CÓDIGOS QR
//
// Este archivo centraliza todos los marcadores QR del proyecto.
// Así evitamos escribir muchos if en scanner_screen.dart.
//
// Autor: Equipo Proyecto RA
// ======================================================================

class QRService {
  // ------------------------------------------------------------------
  // Método que recibe el texto leído por el QR
  // y devuelve el nombre de la acción que debe realizar.
  // ------------------------------------------------------------------
  static String obtenerAccion(String codigo) {
    switch (codigo.toUpperCase()) {
      case "INFO_SENA":
        return "INFO";

      default:
        return "DESCONOCIDO";
    }
  }
}