import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Homepagecontroller extends GetxController{

  RxInt index=0.obs;

  void trackIndexBottomnavigationBar(int indexofBottombNavigation)
  {
     index.value=indexofBottombNavigation;

    //  debugPrint("index value $index");
  }

  // List of Pges
  final pages=['Home Screen','Search Screen','Add Page Screen','Message Screen','Profile Screen',];
  
}