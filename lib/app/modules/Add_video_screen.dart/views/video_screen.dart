
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/uploadvideo_controller.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/views/video_player_item.dart';
import 'package:tiktokclone/app/utils/global.dart';
import 'package:tiktokclone/app/utils/svg_image.dart';
import 'package:tiktokclone/resource/app_images.dart';
import 'package:tiktokclone/widgets/circle_animation.dart';


class VideoScreen extends GetView<AddVideoScreenController>
{
   VideoScreen({super.key});
 final UploadVideoController uploadVideoController=Get.put(UploadVideoController());
  var logger = Logger();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(builder: (controller){
       return Scaffold(
        body: PageView.builder(
          itemCount: uploadVideoController.datalist.length,
          controller: PageController(initialPage: 0,viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, Index)        
          { 
            // final data=uploadVideoController.datalist[Index];
            return  Stack(
               
              children: [
                VideoPlayerItem(videoUrl: uploadVideoController.datalist[Index].videoUrl),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: getFullheight(context,77.0)),
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                            Text(uploadVideoController.datalist[Index].username,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
                           SizedBox(height: getFullheight(context,0.002)),                      
                            Text(uploadVideoController.datalist[Index].caption,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                            SizedBox(height: getFullheight(context,0.002),), 
                            Text(uploadVideoController.datalist[Index].songName,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400)),
                            SizedBox(height: getFullheight(context,0.002)), 
                           const Row(
                            children: [
                                    Icon(Icons.music_note,size: 12,color: Colors.white,),
                                    Text('Roddy Roundicch - The Rou',style: TextStyle(fontSize: 15,color: Colors.white),)
                            ],),
                             SizedBox(height: getFullheight(context,1)), 
                      
                      ],),
                    ),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              child: Container(
                                width: 20,
                                height: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15,),
                              Column(
                                children: [
                              InkWell(
                                onTap: (){
                        
                                },
                                child: const Icon(Icons.favorite,size: 33,color: Colors.red,)),
                                const SizedBox(height: 7,),
                                 Text(uploadVideoController.datalist[Index].likes.toString(),style: TextStyle(fontSize: 13,color: Colors.white),),
                            ],),
                            const SizedBox(height: 15,),        
                        
                             Column(
                                children: [
                              InkWell(
                                onTap: (){
                        
                                },
                                child: const SVGImage(imagePath: ImgAssetPath.commenticon, imageType: ImageType.svg)),
                                const SizedBox(height: 7,),
                                 Text(uploadVideoController.datalist[Index].commentCount.toString(),style: TextStyle(fontSize: 13,color: Colors.white),),
                            ],),
                        
                        
                             Column(
                                children: [
                              InkWell(
                                onTap: (){
                        
                                },
                                child: const SVGImage(imagePath: ImgAssetPath.shareIcon, imageType: ImageType.svg)),
                                const SizedBox(height: 7,),
                                 Text(uploadVideoController.datalist[Index].sharecount.toString(),style: TextStyle(fontSize: 13,color: Colors.white),),
                            ],),
                            CircleAnimation(child:controller.buildMusicAlbum("profile photo"),)
                          ],                            
                        )                  
                      
                          
                      ],
                    )
                  ],
                )
              ],
            ).marginOnly(left: 12);
          
            

          }),
       );
    });
  }
  
}



