
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/add_video_screen.dart';

class Homepagecontroller extends GetxController{

  RxInt index=0.obs;

  void trackIndexBottomnavigationBar(int indexofBottombNavigation)
  {
     index.value=indexofBottombNavigation;

    //  debugPrint("index value $index");
  }

  // List of Pges
  // final pages=['Home Screen','Search Screen','Add Page Screen','Message Screen','Profile Screen',];
  final pages=[ Text('Home Screen'), Text('earch Screen'), AddVideoScreen(), Text('Message Screen'), Text('Profile Screen')];
  
} 