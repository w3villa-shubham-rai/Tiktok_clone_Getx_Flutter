

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/confirm_screen.dart';
import 'package:video_player/video_player.dart';

class AddVideoScreenController extends GetxController{
final Logger logger=Logger();
  
   late Rx<File?> videoStoreObj = Rx<File?>(null);

   late final File videoFile;
   late final String videopath;
   late VideoPlayerController controllerofvideo;
   final songcontroller=TextEditingController();
   final captioncontroller=TextEditingController();

   @override
  void onInit() {
    super.onInit();
    controllerofvideo.value=VideoPlayerController.file(videoStoreObj as File) as VideoPlayerValue;
    controllerofvideo.initialize();
    controllerofvideo.play();
    controllerofvideo.setVolume(1);
    controllerofvideo.setLooping(true);    
  }

  void pickedVideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    logger.d('This is a debug message');
    // logger.i('This is an info message');
    // logger.w('This is a warning message');
    // logger.e('This is an error message');
    // logger.v('This is a verbose message');
    if (video != null) {
      videoStoreObj.value = File(video.path!);
       Get.to(ConfirmScren());
      logger.d("this is url of video $videoStoreObj");
    }
  }

  
}