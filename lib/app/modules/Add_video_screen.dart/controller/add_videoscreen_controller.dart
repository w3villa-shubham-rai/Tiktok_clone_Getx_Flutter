import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/uploadvideo_controller.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/confirm_screen.dart';
import 'package:video_player/video_player.dart';

class AddVideoScreenController extends GetxController {
  final Logger logger = Logger();

  late final Rx<File?> videoStoreObj = Rx<File?>(null);
  late final File videoFile;
  late final String? videopath; // Make it nullable
  late final VideoPlayerController? controllerofvideo; // Make it nullable

  final songcontroller = TextEditingController();
  final captioncontroller = TextEditingController();
  UploadVideoController uploadVideoController = Get.put(UploadVideoController());

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void pickedVideo(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      videoStoreObj.value = File(video.path!);
      videopath = videoStoreObj.value!.path; 
      controllerofvideo = VideoPlayerController.file(videoStoreObj.value!);
      await controllerofvideo!.initialize();
      controllerofvideo!.play();
      controllerofvideo!.setVolume(1);
      controllerofvideo!.setLooping(true);
      Get.to(() => ConfirmScren());
      logger.d("this is url of video $videoStoreObj");
    }
  }


  buildMusicAlbum(String profilevideo)
  {
    return SizedBox(width: 60,height: 60,
    child:Column(children: [
      Container(padding: EdgeInsets.all(11),height: 50,width: 50,decoration: BoxDecoration(gradient: const LinearGradient(colors: [Colors.grey,Colors.white]),
      borderRadius: BorderRadius.circular(25),      
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(25),child: Image(image: NetworkImage('profilephoto'),fit: BoxFit.contain,),),
      ),
    ],) ,);

  }
}
