
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/add_video_screen.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/video_screen.dart';

class Homepagecontroller extends GetxController{

  RxInt index=0.obs;
  AddVideoScreenController addVideoScreenController= Get.put(AddVideoScreenController());

  void trackIndexBottomnavigationBar(int indexofBottombNavigation)
  {
     index.value=indexofBottombNavigation;

    //  debugPrint("index value $index");
  }

  // List of Pges
  // final pages=['Home Screen','Search Screen','Add Page Screen','Message Screen','Profile Screen',];
  final pages=[ VideoScreen(), Text('earch Screen'), AddVideoScreen(), VideoScreen(), Text('Profile Screen')];
  
} 