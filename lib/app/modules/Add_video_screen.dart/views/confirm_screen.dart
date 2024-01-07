import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/app/utils/global.dart';
import 'package:video_player/video_player.dart';


class ConfirmScren extends GetView<AddVideoScreenController>{

  
   ConfirmScren({super.key});
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(
      init:AddVideoScreenController() ,
      builder: (controller) {
      return  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.5,
                child: VideoPlayer(controller.controllerofvideo),
              ),
              SizedBox(height: 30,),
               SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: getFullWidth(context)-20,
                        child: TextFormField(
                          controller: controller.songcontroller,
                          decoration: const InputDecoration(
                            label: Text("Song Name"), 
                            icon: Icon(Icons.music_note)
                          ),                          
                        ),
                        
                    ),
                   const SizedBox(height: 20,),

                     Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: getFullWidth(context)-20,
                        child: TextFormField(
                          controller: controller.captioncontroller,
                          decoration: const InputDecoration(
                            label: Text("Song Name"), 
                            icon: Icon(Icons.music_note)
                          ),                          
                        ),
                        
                    ),
                  ],
                ),
              )
            ],
          ),
        )

       
      );
    },);
  }
  
}