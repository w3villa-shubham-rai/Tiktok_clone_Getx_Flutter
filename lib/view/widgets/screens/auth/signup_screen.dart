import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/controllers/logincontroller/logincontroller.dart';
import 'package:tiktokclone/resource/String.dart';
import 'package:tiktokclone/resource/colors.dart';
import 'package:tiktokclone/view/widgets/screens/auth/login_scrren.dart';

class Signupscreen extends StatelessWidget {
    Signupscreen({super.key});
  final LogInController logInController = Get.find<LogInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Register", style: TextStyle(fontSize: 30)),
              ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 20),
                 child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1668900831790-d9fbeb133604?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      radius: 60,
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 66,
                      child: IconButton(
                          onPressed: () {
                            authcontroller.pickImage();
                          },
                          icon: Icon(Icons.add_a_photo)),
                    )
                  ],
                             ),
               ),
              TextFormField(
                controller: logInController.usernamecontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bordercolor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bordercolor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: TextFormField(
                  controller: logInController.emailnamecontroller,
                  decoration: const InputDecoration(
                    hintText: 'email',
                    suffixIcon: Icon(Icons.email_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: logInController.passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bordercolor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: bordercolor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: InkWell(
                  onTap: () => authcontroller.userregister(logInController.usernamecontroller.text,logInController.emailnamecontroller.text,logInController.passwordcontroller.text, authcontroller.imageFile.value),
                  child: Container(
                    alignment: Alignment.center,
                    height: 46,
                    // width: double.infinity,
                    width: MediaQuery.of(context).size.width,                 
                    color: buttoncolor,
                    child: const Text("Register"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Already have an account ?",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: InkWell(
                       onTap:(){
                          Get.to(LoginScreen());
                      },
                        child: Text(" Login",
                            style:
                                TextStyle(fontSize: 17, color: buttoncolor))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
