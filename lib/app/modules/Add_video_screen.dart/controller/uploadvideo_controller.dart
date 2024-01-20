

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/models/video_upload_models.dart';
import 'package:tiktokclone/resource/String.dart';
import 'package:video_compress/video_compress.dart';
import 'package:video_player/video_player.dart';
class UploadVideoController extends GetxController{

// UploadTask and   TaskSnapshot


// in Firebase, a DocumentSnapshot is an object that 
// represents a snapshot of a document from a Firestore database. Firestore is a 
// NoSQL database provided by Firebase, and it is used to store and manage data in the form of documents 
// within collections. Each document contains key-value pairs of data.
 



 Future<String> _uploadVideoToStorage(String id, String videoPath)async{

    Reference ref=firebasestorage.ref().child('videos').child(id);

    UploadTask uploadTask=ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot taskSnapshot=await uploadTask;
    String downloadurl=await taskSnapshot.ref.getDownloadURL();    
    return downloadurl; 

 }

 _compressVideo(String videoPath)async{
   final compressVideo=await VideoCompress.compressVideo(videoPath,quality: VideoQuality.MediumQuality);
   return compressVideo!.file;
 }

 Future<String>__uploadImageToStorage(String id,String videoPath)async
    {
      Reference ref=firebasestorage.ref().child('thumbnils').child(id);
      UploadTask uploadtask=ref.putFile(await _getThumbnil(videoPath));
      TaskSnapshot tasksnap=await uploadtask;
      String downloadurl=await tasksnap.ref.getDownloadURL();
      return downloadurl;
   }

   _getThumbnil(String videoPath)async{
     final thumbnils=await VideoCompress.getFileThumbnail(videoPath);
     return thumbnils;
   }
   

  uploadVideonstoreDatabase(String songName,String videoCapTion, String videoPath) async{
     try{
        String uid=firebaseauth.currentUser!.uid;
        DocumentSnapshot userDoc= await firestore.collection('users').doc(uid).get();
        var allDocs=await firestore.collection('videos').get();
        int len=allDocs.docs.length;
        String videoUrl=await _uploadVideoToStorage("Video $len", videoPath);
        String thumbnils=await __uploadImageToStorage("Video $len", videoPath);   

      VideoUploadmodels video=VideoUploadmodels(username: (userDoc.data()! as Map<String,dynamic>)['name'],uid: uid, id: "videos $len",likes: [],commentCount: 0,sharecount: 0,songName: songName,
       videoUrl: videoUrl,profilephoto: (userDoc.data()! as Map<String,dynamic>)['profilephoto'], thumbnils: thumbnils, comments:  [], caption: '');

       await FirebaseFirestore.instance.collection('videos').doc('Videos $len').set(video.tojson());
       Get.back();
               
     }
     catch(e){
        Get.snackbar("not upload video", "") ;
     }
  }
}