import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_downlad/providers/my_video_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video player"),
      ),
      body: Consumer<MyVideoProvider>(
        builder: (context, provider, _) {
          if (provider.getVidCont == null) {
            return Center(child: CircularProgressIndicator());
          } else
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(
                      // agregar el Video player (quita el container)
                      provider.getVidCont!),
                ),
                Text(
                  "${provider.getVidCont!.value.position} / ${provider.getVidCont!.value.duration}",
                ),
                // Agregar Video Player indicator
                VideoProgressIndicator(
                  provider.getVidCont!,
                  allowScrubbing: true,
                ),
                // agregar boton de play/pause
                ElevatedButton.icon(
                  icon: Icon(provider.getVidCont!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                  label: Text(provider.getVidCont!.value.isPlaying
                      ? "Pausar"
                      : "Reproducir"),
                  onPressed: () {
                    // guardar el tiempo en que esta el video
                    provider
                        .isPlayOrPause(provider.getVidCont!.value.isPlaying);
                  },
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("Guardar"),
                  onPressed: () {
                    // guardar el tiempo en que esta el video
                    provider.saveConfigs();
                    
                  },
                ),
                MaterialButton(
                  child: Text("Mover a"),
                  onPressed: () {
                    // mover a tiempo guardado
                    provider.loadConfigs();
                  },
                ),
              ],
            );
        },
      ),
    );
  }
}
