

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
 



Future<String> _uploadVideoToStorage(String id, String videoPath)async{
   print("check four ++++++++++++++ $id, $videoPath");

    Reference ref=firebasestorage.ref().child('videos').child(id);

    UploadTask uploadTask=ref.putFile(File(videoPath));
    TaskSnapshot taskSnapshot=await uploadTask;
    String downloadurl=await taskSnapshot.ref.getDownloadURL();    
    return downloadurl; 

 }

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
   

 Future<void> uploadVideonstoreDatabase(String songName, String videoCaption, String videoPath) async {
  try {
    print("check ++++++++++++++ $songName, $videoCaption, $videoPath");

    // Ensure videoPath is not null
    if (videoPath == null) {
      throw Exception("Video path is null");
    }

    String uid = firebaseauth.currentUser!.uid;
    DocumentSnapshot userDoc = await firestore.collection('users').doc(uid).get();
    var allDocs = await firestore.collection('videos').get();
    int len = allDocs.docs.length;

    print("Before _uploadVideoToStorage");
    String? videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
    print("After _uploadVideoToStorage");

    String thumbnails = await __uploadImageToStorage("Video $len", videoPath);
    print("check one ++++++++++++++ $songName, $videoCaption, $videoPath");

    Map<String, dynamic> videoData = {
      'username': (userDoc.data()! as Map<String, dynamic>)['name'],
      'uid': uid,
      'id': "Videos $len",
      'likes': [],
      'commentCount': 0,
      'sharecount': 0,
      'songName': songName,
      'videoUrl': videoUrl,
      'profilephoto': (userDoc.data()! as Map<String, dynamic>)['profilephoto'],
      'thumbnails': thumbnails,
      'comments': [],
      'caption': videoCaption,
    };

    await FirebaseFirestore.instance.collection('videos').doc('Videos $len').set(videoData);
    Get.back();
  } catch (e) {
    print("Error in uploadVideonstoreDatabase: $e");
    Get.snackbar("Failed to upload video", "$e");
  }
}


List<VideoUploadmodels> datalist = [];

void fetchVideosData() async {

debugPrint("--------------------------------- Fetching Data-----------------------------------");

  try {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    CollectionReference collection = fireStore.collection('videos');

    QuerySnapshot querySnapshot = await collection.get();

    datalist = querySnapshot.docs.map((doc) => VideoUploadmodels.fromSnap(doc)).toList();

    debugPrint("Fetched Data: $datalist");
  } catch (e) {
    debugPrint("Error fetching data: $e");
  }
}

RxBool likes=false.obs;
var likescount=0;
var sotervideoid;

void likeDislikeFun({required String videoId} ) async
{
  // videoId=videoId;
  sotervideoid=videoId;
  // dislikeVideo(videoId: videoId);
  
var currentUser=firebaseauth.currentUser?.uid;

DocumentSnapshot documentSnapshot =await FirebaseFirestore.instance.collection('videos').doc(videoId).get();
 List<dynamic> likes = documentSnapshot['likes'] ?? [];
 List<String> likesIds = likes.map((like) => like.toString()).toList();
 likescount=likesIds.length;
 if(likesIds.contains(currentUser))
 {
      var currentUserone=firebaseauth.currentUser?.uid;
      await FirebaseFirestore.instance.collection('videos').doc(videoId).update({'likes':FieldValue.arrayRemove([currentUserone])});
      likecount(videoId: videoId);
 }
 else{
var currentUser=firebaseauth.currentUser?.uid;
  await FirebaseFirestore.instance.collection('videos').doc(videoId).update({'likes':FieldValue.arrayUnion([currentUser])});
  likecount(videoId: videoId);
 } 

}

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
    likecount(videoId:sotervideoid);
  }
   
}