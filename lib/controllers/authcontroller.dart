import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/app/modules/HmoeScreen/views/homescree.dart';
import 'package:tiktokclone/models/usermodel.dart' as model;
import 'package:tiktokclone/resource/String.dart';
import 'package:tiktokclone/view/widgets/screens/auth/login_scrren.dart';
class AuthController extends GetxController{  
static AuthController instance=Get.find();

 late Rx<User?> _user;
 
late Rx<File?> imageFile = File("").obs;


@override
  void onReady() {
    super.onReady();
    _user=Rx<User?>(firebaseauth.currentUser);
    _user.bindStream(firebaseauth.authStateChanges());
    ever(_user, _setInitialScreen);
 }
_setInitialScreen(User? user)
{
  if(user==null)
  {
    Get.offAll(()=>LoginScreen());
  }
  else{
    Get.offAll(()=> HomeScreen());
  }
}

void pickImage() async {
  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {  
    String imagePath = pickedImage.path ;  
    File imageFileValue = File(imagePath);  
    imageFile.value = imageFileValue;
    Get.snackbar("Success", "Image selected successfully. Path: $imagePath");
  }
}



Future<String>_uploadToStorageImage(File image)async{
        Reference ref=firebasestorage.ref().child('profilepics').child(firebaseauth.currentUser!.uid);
        UploadTask uploadTask= ref.putFile(image);
        TaskSnapshot snap=await uploadTask;
        String downloadedimageurl=await snap.ref.getDownloadURL();
        return downloadedimageurl;
      }



 void userregister(String username,String email, String password,  image)async{
   try{    
    if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image !=null){
     UserCredential crede= await firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
    String downloadurl=await _uploadToStorageImage(image);
     model.User user = model.User(name: username, email: email, uid: crede.user!.uid, profilephoto: downloadurl);
    await firestore.collection('users').doc(crede.user!.uid).set(user.toJson());
    Get.snackbar("sucees", "register sucess");
    }
    else{
       Get.snackbar("user not create sucess", "please enter the al field");
    }
    
   }
   catch(e){
    print("Caught an exception: $e");
    Get.snackbar("user not create", e.toString());
   }
 }



void loginUser(String email, String password) async {
  try {
    if (email.isNotEmpty && password.isNotEmpty) {
    
      await firebaseauth.signInWithEmailAndPassword(email: email, password: password);     
      Get.snackbar("User logged in", "Success");
      // if (firebaseauth.currentUser!=null) {
      //    Get.to(const HomeScreen());
      // }
      // else{
      //   Get.to(LoginScreen());
      // }
    } else {      
      Get.snackbar("User not logged in", "Email and password cannot be empty");
    }
  } catch (e) {
    
    Get.snackbar("User not logged in", e.toString());
  }
}

}





  
