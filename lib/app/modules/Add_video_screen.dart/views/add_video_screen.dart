import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktokclone/app/modules/Add_video_screen.dart/controller/add_videoscreen_controller.dart';
import 'package:tiktokclone/resource/colors.dart';

class AddVideoScreen extends GetView<AddVideoScreenController> {
  const AddVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVideoScreenController>(
        init: AddVideoScreenController(),
        builder: (controller) {
          return Scaffold(
            body: InkWell(
              onTap: () {
                showOptionDialogBox(context);
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    color: buttoncolor,
                  ),
                  child: const Center(
                      child: Text(
                    "Add Video",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          );
        });
  }

  Future showOptionDialogBox(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () {
                   controller.pickedVideo(ImageSource.gallery);
              },
              child: mediaselectbtn(btnname:"Gallery",icon:Icons.image),
            ),
            SimpleDialogOption(
              onPressed: () {
                controller.pickedVideo(ImageSource.camera);
              },
              child: mediaselectbtn(btnname:"Camera",icon:Icons.camera_alt),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: mediaselectbtn(btnname:"Cancel",icon:Icons.cancel),
            ),
          ],
        );
      },
    );
  }

  Widget mediaselectbtn({required String  btnname, required IconData icon}) {
    return Container(
      child: Row(
        children: [
          Icon(icon, color: buttoncolor),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              btnname,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
