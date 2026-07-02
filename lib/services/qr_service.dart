// ======================================================================
// SERVICIO PARA ADMINISTRAR LOS CÓDIGOS QR
//
// Este archivo centraliza todos los marcadores QR del proyecto.
// Cada código QR devuelve una acción que utilizará ScannerScreen.
//
// Autor: Equipo Proyecto RA
// ======================================================================

class QRService {
  // Devuelve la acción correspondiente al contenido del QR
  static String obtenerAccion(String codigo) {
    // Normaliza el texto para evitar problemas con espacios o mayúsculas
    codigo = codigo.trim().toUpperCase();

    switch (codigo) {
      // Abre la pantalla de información
      case "INFO_SENA":
        return "INFO";

      // Abre la pantalla de video
      case "VIDEO_SENA":
        return "VIDEO";

      // QR no registrado
      default:
        return "DESCONOCIDO";
    }
  }
}