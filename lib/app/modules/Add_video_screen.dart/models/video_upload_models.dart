import 'package:cloud_firestore/cloud_firestore.dart';

class VideoUploadmodels {
  final String? uid;
  final String? id;
  final List<dynamic>? likes;
  final int? commentCount;
  final int? sharecount;
  final String? songName;
  final String? videoUrl;
  final String? thumbnails;
  final List<dynamic>? comments;
  final String? caption;

  VideoUploadmodels({
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.sharecount,
    required this.songName,
    required this.videoUrl,
    required this.thumbnails,
    required this.comments,
    required this.caption,
  });

  factory VideoUploadmodels.fromMap(Map<String, dynamic> data) {
  return VideoUploadmodels(
    uid: data['uid'],
    id: data['id'],
    likes: List<dynamic>.from(data['likes']),
    commentCount: data['commentCount'],
    sharecount: data['sharecount'],
    songName: data['songName'],
    videoUrl: data['videoUrl'],
    thumbnails: data['thumbnails'],
    comments: List<dynamic>.from(data['comments']),
    caption: data['caption'],
  );
}
 
  
  
}

