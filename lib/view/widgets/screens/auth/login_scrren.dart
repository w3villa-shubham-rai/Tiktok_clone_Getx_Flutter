import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktokclone/controllers/logincontroller/logincontroller.dart';
import 'package:tiktokclone/resource/String.dart';
import 'package:tiktokclone/resource/colors.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);  
  final LogInController logInController = Get.find<LogInController>();
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final LogInController logInController = Get.find<LogInController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Container(
            alignment: Alignment.center,
            child: Column(
            
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 35),
                  child: Text("Log In", style: TextStyle(fontSize: 30)),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email or username'),
                    Text('Log in with Phone'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: widget.logInController.emailnamecontroller,
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
                  controller: widget.logInController.passwordcontroller,
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
                    onTap: () {
                      authcontroller.loginUser(logInController.emailnamecontroller.text, logInController.passwordcontroller.text);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 46,
                      // width: double.infinity,
                      color: buttoncolor,
                      child: const Text("Log In"),
                    ),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "Don't have an account ?",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: InkWell(
                          onTap: () {
                            
                          },
                          child:  Text(" Register",
                              style: TextStyle(fontSize: 17,color:buttoncolor))),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
