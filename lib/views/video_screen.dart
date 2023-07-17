import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends GetView<VideoController> {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<VideoController>(
        builder: (controller) {
          return IndexedStack(
            index:
                controller.videoController?.value.isInitialized == true ? 0 : 1,
            children: [
              AspectRatio(
                aspectRatio: controller.videoController?.value.aspectRatio ?? 0,
                child: VideoPlayer(controller.videoController!),
              ),
              Container(),
            ],
          );
        },
      ),
    );
  }
}
