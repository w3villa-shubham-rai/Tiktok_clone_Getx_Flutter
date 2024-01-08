import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/confirm_screen.dart';
import 'package:video_player/video_player.dart';


class AddVideoScreenController extends GetxController {
  final Logger logger = Logger();

  late final Rx<File?> videoStoreObj = Rx<File?>(null);
  late final File videoFile;
  late final String videopath;
  late final VideoPlayerController? controllerofvideo; // Make it nullable

  final songcontroller = TextEditingController();
  final captioncontroller = TextEditingController();
 

  @override
  Future<void> onInit() async {
    super.onInit();

  }

  void pickedVideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      videoStoreObj.value = File(video.path!);
      controllerofvideo = VideoPlayerController.file(videoStoreObj.value!);
      await controllerofvideo!.initialize();
      controllerofvideo!.play();
      controllerofvideo!.setVolume(1);
      controllerofvideo!.setLooping(true);
      Get.to(() => ConfirmScren());
      logger.d("this is url of video $videoStoreObj");
    }
  }
}

