

import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class AddVideoScreenController extends GetxController{
final Logger logger=Logger();
  
   late Rx<File?> videoStoreObj = Rx<File?>(null);

  
  void pickedVideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    logger.d('This is a debug message');
    // logger.i('This is an info message');
    // logger.w('This is a warning message');
    // logger.e('This is an error message');
    // logger.v('This is a verbose message');
    if (video != null) {
      videoStoreObj.value = File(video.path!);
      logger.d("this is url of video $videoStoreObj");
    }
  }

  
}