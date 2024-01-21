import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/widgets/circle_animation.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends GetView<AddVideoScreenController>
{
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(builder: (controller){
       return Scaffold(
        body: PageView.builder(
          itemCount: 4,
          controller: PageController(initialPage: 0,viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, Index)        
          {        
          
            return  Stack(
              children: [
                //  VideoPlayerItem(videoUrl: "lwfe",),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 110),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 125),
                                child: Text("UserName"),
                              ),
                                Padding(
                                padding: EdgeInsets.only(right: 125),
                                child: Text("caption"),
                              ),
                                Padding(
                                padding: EdgeInsets.only(right: 125),
                                child: Text("music name"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(children: [
                                  Icon(Icons.music_note,size: 15,color: Colors.white,),
                                  Text('Roddy Roundicch - The Rou',style: TextStyle(fontSize: 15,color: Colors.white),)
                                ],),
                              )
                            ],
                          ),
                        ),
                        Container( 
                          child:  Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 10,),
                                Column(
                                  children: [
                                InkWell(
                                  onTap: (){

                                  },
                                  child: const Icon(Icons.favorite,size: 40,color: Colors.red,)),
                                  const SizedBox(height: 7,),
                                  const Text('2 ',style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],),
                              SizedBox(height: 10,),


                               Column(
                                  children: [
                                InkWell(
                                  onTap: (){

                                  },
                                  child: const Icon(Icons.comment,size: 40,color: Colors.red,)),
                                  const SizedBox(height: 7,),
                                  const Text('3',style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],),


                               Column(
                                  children: [
                                InkWell(
                                  onTap: (){

                                  },
                                  child: const Icon(Icons.share,size: 40,color: Colors.red,)),
                                  const SizedBox(height: 7,),
                                  const Text('300 likes ',style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],),
                              CircleAnimation(child:controller.buildMusicAlbum("profile photo"),)
                            ],                            
                          ),                          
                        )
                        
                      ],
                     ).marginOnly(left: 30,right: 30)
                  ],
                )
              ],
            );

          }),
       );
    });
  }
  
}



