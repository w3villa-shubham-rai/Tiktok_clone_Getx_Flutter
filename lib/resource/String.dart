import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktokclone/controllers/authcontroller.dart';

var firebaseauth=FirebaseAuth.instance;
var firebasestorage=FirebaseStorage.instance;
var firestore=FirebaseFirestore.instance;


var authcontroller=AuthController.instance;

