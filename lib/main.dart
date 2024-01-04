import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/controllers/authcontroller.dart';
import 'package:tiktokclone/controllers/logincontroller/logincontroller.dart';
import 'package:tiktokclone/firebase_options.dart';
import 'package:tiktokclone/resource/colors.dart';
import 'package:tiktokclone/view/widgets/screens/auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
       options: DefaultFirebaseOptions.currentPlatform,
).then((Value){
        Get.put(AuthController());
});

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktoktok clone',
      theme:ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: Signupscreen(),
    );
  }
}
