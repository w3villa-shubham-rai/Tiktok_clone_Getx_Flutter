import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/app/modules/HmoeScreen/controller/home_page_controller.dart';
import 'package:tiktokclone/resource/colors.dart';
import 'package:tiktokclone/widgets/coustomwidget.dart';


class HomeScreen extends GetView<Homepagecontroller>{
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homepagecontroller>(
       init: Homepagecontroller(),
      builder: (controller){      
      return Obx(() {
        return Scaffold(
        bottomNavigationBar: BottomNavigationBar(  
          onTap: (idx) {
             controller.trackIndexBottomnavigationBar(idx);
          },
          backgroundColor: backgroundColor,   
          type: BottomNavigationBarType.fixed,  
          selectedItemColor: Colors.red,   
          unselectedItemColor: Colors.white,
          currentIndex: controller.index.value,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search,size: 30,),label: 'Search'),
            BottomNavigationBarItem(icon: CousTomIcon(),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.message,size: 30,),label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,),label: 'Profile'),
          ]
        ),
        body:(controller.pages[controller.index.value])
      );
      });
    });
  }
 
}