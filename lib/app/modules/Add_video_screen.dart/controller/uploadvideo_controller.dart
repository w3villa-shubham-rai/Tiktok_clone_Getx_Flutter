import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/state_manager.dart';
import 'package:tiktokclone/resource/String.dart';
import 'package:video_compress/video_compress.dart';

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

  uploadVideonstoreDatabase(String songName,String videoCapTion, String videoPath) async{
     try{
        String uid=firebaseauth.currentUser!.uid;
        DocumentSnapshot userDoc= await firestore.collection('users').doc(uid).get();
        var allDocs=await _uploadVideoToStorage("Video $len",videoPath);
     }
     catch{
         
     }
  }
}