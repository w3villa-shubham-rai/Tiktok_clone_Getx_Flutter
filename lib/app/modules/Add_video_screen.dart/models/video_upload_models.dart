import 'package:cloud_firestore/cloud_firestore.dart';

class VideoUploadmodels {
  final String username;
  final String uid;
  final String id;
  final List<dynamic>? likes;
  final int commentCount;
  final List<dynamic>? comments;
  final int sharecount;
  final String songName;
  final String caption;
  final String videoUrl;
  final String thumbnils;
  final String profilephoto;

  VideoUploadmodels({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.comments,
    required this.sharecount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnils,
    required this.profilephoto,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "comments": comments,
        "sharecount": sharecount,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnils": thumbnils,
        "profilephoto": profilephoto,
      };

  static VideoUploadmodels fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return VideoUploadmodels(
      username: snapshot['username'] ?? '',
      uid: snapshot['uid'] ?? '',
      id: snapshot['id'] ?? '',
      likes: snapshot['likes'] as List<dynamic>? ?? [],
      commentCount: snapshot['commentCount'] ?? 0,
      comments: snapshot['comments'] as List<dynamic>? ?? [],
      sharecount: snapshot['sharecount'] ?? 0,
      songName: snapshot['songName'] ?? '',
      caption: snapshot['caption'] ?? '',
      videoUrl: snapshot['videoUrl'] ?? '',
      thumbnils: snapshot['thumbnails'] ?? '',
      profilephoto: snapshot['profilephoto'] ?? '',
    );
  }
}

