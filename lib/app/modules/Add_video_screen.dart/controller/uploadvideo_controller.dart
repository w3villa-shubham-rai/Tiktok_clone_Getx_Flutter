

import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/models/video_upload_models.dart';
import 'package:tiktokclone/resource/String.dart';
import 'package:video_compress/video_compress.dart';
class UploadVideoController extends GetxController{

// UploadTask and   TaskSnapshot


// in Firebase, a DocumentSnapshot is an object that 
// represents a snapshot of a document from a Firestore database. Firestore is a 
// NoSQL database provided by Firebase, and it is used to store and manage data in the form of documents 
// within collections. Each document contains key-value pairs of data.
 





// Future<File?> _compressVideo(String? videoPath) async {
//   if (videoPath == null) {
//     // Handle the case where videoPath is null
//     return null;
//   }

//   try {
//     print("check three ++++++++++++++  $videoPath");
//     final compressVideo = await VideoCompress.compressVideo(videoPath, quality: VideoQuality.MediumQuality);
    
//     // Check if the compression was successful
//     if (compressVideo != null && compressVideo.file != null) {
//       return compressVideo.file!;
//     } else {
//       // Handle the case where the compression result is null or the file is null
//       return null;
//     }
//   } catch (e) {
//     // Handle compression errors
//     print("Error compressing video: $e");
//     return null;
//   }
// }
// try{
//   await FirebaseFirestore.instance.collection('videos').get().then((value){
//     dynamic datas = value.docs as List;
//     dynamic val = datas[0].data() as Map;
//     debugPrint("^^^^^^^^^^^^^^^^^^^^^^^^^^^^________________________+++++++++++++++++++=======================Response is ${val}");
//   });
// } catch(e){
//   debugPrint("Error is ------------------------------------------------------------- $e");
// }


Future<String> _uploadVideoToStorage(String id, String videoPath)async{
   print("check four ++++++++++++++ $id, $videoPath");

    Reference ref=firebasestorage.ref().child('videos').child(id);

    UploadTask uploadTask=ref.putFile(File(videoPath));
    TaskSnapshot taskSnapshot=await uploadTask;
    String downloadurl=await taskSnapshot.ref.getDownloadURL();    
    return downloadurl; 

 }

 Future<String>__uploadImageToStorage(String id,String videoPath)async
    {
       print("check two ++++++++++++++ $id, $videoPath");
      Reference ref=firebasestorage.ref().child('thumbnils').child(id);
      UploadTask uploadtask=ref.putFile(await _getThumbnil(videoPath));
      TaskSnapshot tasksnap=await uploadtask;
      String downloadurl=await tasksnap.ref.getDownloadURL();
      return downloadurl;
   }

   _getThumbnil(String videoPath)async{

    if (videoPath == null) {
    // Handle the case where videoPath is null
    return null;
  }
     final thumbnils=await VideoCompress.getFileThumbnail(videoPath);
     return thumbnils;
   }
   

Future<void> uploadVideoToFirestore(String songName, String videoCaption, String videoPath) async {
  try {
    if (videoPath == null) {
      debugPrint("Video Path find NULL");
      throw Exception("Video path is null");
    }
    if (firebaseauth.currentUser != null) {
      String uid = firebaseauth.currentUser!.uid;
      debugPrint("User UID is $uid");
      String time = DateTime.now().millisecondsSinceEpoch.toString();
      String? videoUrl = await _uploadVideoToStorage("$time", videoPath);
      await firestore.collection('videoData').doc(time).set({
          'uid': uid,
          'id': "$time",
          'likes': [],
          'commentCount': 0,
          'sharecount': 0,
          'songName': songName,
          'videoUrl': videoUrl,
          // 'profilephoto': userData['profilephoto'],
          'thumbnails': 'thumbnails',
          'comments': [],
          'caption': videoCaption,
        });
    } else {
      // Handle the case where the user is not authenticated
      print("User is not authenticated");
      // You can show a message or navigate to the login screen
    }
  } catch (e) {
    print("Error in uploadVideoToFirestore: $e");
    Get.snackbar("Failed to upload video", "$e");
  }
}

List<VideoUploadmodels>  datalist = [];
Future<List<VideoUploadmodels>> fetchVideosData() async {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    // String uid = firebaseauth.currentUser!.uid;  
  CollectionReference collection = fireStore.collection('videoData'); 
 try {   
  QuerySnapshot querySnapshot = await collection.get();       
  print('Number of documents: ${querySnapshot.docs.length}');
  List<VideoUploadmodels> dataList = [];
  querySnapshot.docs.forEach((doc) {
    VideoUploadmodels video = VideoUploadmodels.fromMap(doc.data() as Map<String, dynamic>);
    dataList.add(video);
    debugPrint("VVVVVVVVVVVVVVVVVV?????????????${doc.data()}");
    (doc.data() as Map).forEach((key, value) { 
      debugPrint("Key is $key and Value is $value");
    });
  });
   print('Number of documents++++++: ${dataList.length}');
  return dataList;
} catch (e) {
  print("Error fetching data: $e");
  return []; 
}
}


RxBool likes=false.obs;
var likescount=0;
var sotervideoid;

// void likeDislikeFun({required String videoId} ) async
// {
//   // videoId=videoId;
//   sotervideoid=videoId;
//   // dislikeVideo(videoId: videoId);
  
// var currentUser=firebaseauth.currentUser?.uid;

// DocumentSnapshot documentSnapshot =await FirebaseFirestore.instance.collection('videos').doc(videoId).get();
//  List<dynamic> likes = documentSnapshot['likes'] ?? [];
//  List<String> likesIds = likes.map((like) => like.toString()).toList();
//  likescount=likesIds.length;
//  if(likesIds.contains(currentUser))
//  {
//       var currentUserone=firebaseauth.currentUser?.uid;
//       await FirebaseFirestore.instance.collection('videos').doc(videoId).update({'likes':FieldValue.arrayRemove([currentUserone])});
//       likecount(videoId: videoId);
//  }
//  else{
// var currentUser=firebaseauth.currentUser?.uid;
//   await FirebaseFirestore.instance.collection('videos').doc(videoId).update({'likes':FieldValue.arrayUnion([currentUser])});
//   likecount(videoId: videoId);
//  } 

// }

void likecount({required String videoId})async{
   DocumentSnapshot documentSnapshot =await FirebaseFirestore.instance.collection('videos').doc(videoId).get();
    List<dynamic> likes = documentSnapshot['likes'];
     likescount=likes.length;

     print("like number $likescount");

}



@override
  void onInit() {
    super.onInit();
    fetchVideosData();
    // likecount(videoId:sotervideoid);
  }
   
}