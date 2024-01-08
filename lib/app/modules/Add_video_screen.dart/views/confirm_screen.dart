import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/app/utils/global.dart';
import 'package:video_player/video_player.dart';


class ConfirmScren extends GetView<AddVideoScreenController>{ 
   const ConfirmScren({super.key});

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
              InkWell(
                onTap: (){
                  if(controller.controllerofvideo !=null)
                  {
                    if(controller.controllerofvideo!.value.isPlaying){
                      controller.controllerofvideo!.pause();
                    }
                    else{
                      controller.controllerofvideo!.play();
                    }
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.5,
                  child: VideoPlayer(controller.controllerofvideo ?? VideoPlayerController.network("")),
                ),
              ),
              SizedBox(height: 20,),
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
                            icon: Icon(Icons.music_note),
                            enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 width: 2, color: Colors.red), 
                           ),
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
                            label: Text("Caption"), 
                            icon: Icon(Icons.closed_caption),
                             enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 width: 2, color: Colors.red), 
                           ),
                          ),   
                                                 
                        ),                        
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(onPressed: (){
                      
                      }, child: const Text("Share",style: TextStyle(fontSize: 20,color: Colors.white),)),
                    )
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