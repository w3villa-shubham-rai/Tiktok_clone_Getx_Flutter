import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';

class AddVideoScreen extends GetView<AddVideoScreenController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(builder: (controller){
      return Scaffold();
    });
  }

}