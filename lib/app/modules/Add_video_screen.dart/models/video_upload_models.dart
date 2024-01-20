import 'package:cloud_firestore/cloud_firestore.dart';

class VideoUploadmodels{
   String username;
   String uid;
   String id;
   List likes;
   int commentCount;
   List comments;
   int sharecount;
   String songName;
   String caption;
   String videoUrl;
   String thumbnils;
   String profilephoto;
  VideoUploadmodels({required this.username, required this.uid, 
  required this.id,required this.likes,required this.commentCount,required this.comments, required this.sharecount, required this.songName,
  required this.caption,required this.videoUrl,required this.thumbnils,required this.profilephoto});
   
  Map<String,dynamic> tojson() =>
  {
    "username":username,
    "uid":uid,
    "id":id,
    "likes":likes,
    "commentCount":commentCount,
    "comments":comments,
    "sharecount":sharecount,

    "songName":songName,
    "caption":caption,
    "videoUrl":videoUrl,
    "thumbnils":thumbnils,
    "profilephoto":profilephoto,   
  };

  
  static VideoUploadmodels frmoSnap(DocumentSnapshot snap)
  {
    var snapshot=snap.data()as Map<String,dynamic>;
    return VideoUploadmodels(username: snapshot['username'],uid:snapshot['uid'], id: snapshot['id'],likes: snapshot['likes'], commentCount: snapshot['commentCount'],comments: snapshot['comments'],sharecount: snapshot['sharecount'],
    songName: snapshot['songName'],caption: snapshot['caption'],videoUrl: snapshot['videoUrl'],thumbnils: snapshot['thumbnils'],profilephoto:snapshot['profilephoto'], );
  }

}