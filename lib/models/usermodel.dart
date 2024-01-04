
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String name;
  String email;
  String profilephoto;
  String uid;

  User({required this.name,required this.email,required this.profilephoto,required this.uid});
  Map<String,dynamic>toJson()=>{
    "name":name,
    "email":email,
    "profilephoto":profilephoto,
    "uid":uid,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data()as Map<String,dynamic>;
    return User(name: snapshot['name'], email: snapshot['email'], profilephoto: snapshot['profilephoto'], uid: snapshot['uid']);
  }
}