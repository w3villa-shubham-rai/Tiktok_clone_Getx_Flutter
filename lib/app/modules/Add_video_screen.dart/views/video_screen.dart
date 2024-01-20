import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends GetView<AddVideoScreenController>
{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(builder: (controller){
       return Scaffold(
        body: PageView.builder(
          itemCount: 4,
          controller: PageController(initialPage: 0,viewportFraction: 1),
          itemBuilder: (context, Index)        
          {        
          
            return Stack(
              children: [
                // VideoPlayer(controller)
              ],
            );

          }),
       );
    });
  }
  
}