// Importa los componentes visuales de Flutter
import 'package:flutter/material.dart';

// Importa el reproductor de video
import 'package:video_player/video_player.dart';

// ======================================================================
// PANTALLA DE VIDEO
//
// Reproduce un video almacenado dentro de assets/videos.
// ======================================================================
class VideoScreen extends StatefulWidget {
  // Constructor
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  // Controlador del video
  late VideoPlayerController _controller;

  // Indica si el video terminó de cargarse
  bool _cargando = true;

  @override
  void initState() {
    super.initState();

    // Inicializa el controlador utilizando el video de assets
    _controller = VideoPlayerController.asset(
      'assets/videos/video_sena.mp4',
    );

    // Carga el video
    _controller.initialize().then((_) {

      // Reproduce automáticamente
      _controller.play();

      // Repite el video continuamente
      _controller.setLooping(true);

      setState(() {
        _cargando = false;
      });
    });
  }

  @override
  void dispose() {
    // Libera memoria
    _controller.dispose();
    super.dispose();
  }

  // Pausa o reproduce el video
  void _playPause() {

    setState(() {

      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Video Educativo"),
        centerTitle: true,
      ),

      body: _cargando

          ? const Center(
              child: CircularProgressIndicator(),
            )

          : Column(

              children: [

                const SizedBox(height: 20),

                const Text(
                  "Contenido Multimedia",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),

                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton.icon(

                  onPressed: _playPause,

                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),

                  label: Text(
                    _controller.value.isPlaying
                        ? "Pausar"
                        : "Reproducir",
                  ),

                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Video relacionado con el marcador escaneado.",
                    textAlign: TextAlign.center,
                  ),
                ),

              ],

            ),

    );

  }
}