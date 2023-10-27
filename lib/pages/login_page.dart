

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p1_login_firebase/components/button.dart';
import 'package:p1_login_firebase/components/text_field.dart';
import 'package:p1_login_firebase/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context)=> const Center(
          child: CircularProgressIndicator(),
        )
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
      if(context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (kDebugMode) {
        displayMessage(e.code);
      }
    }
  }

  void displayMessage(String mes) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(mes),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    //logo

                    // const Icon(Icons.lock,size: 80),

                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                    ),

                    const SizedBox(height: 20),

                    //Welcome text
                    const Text('Lotus Calendar'),
                    const SizedBox(height: 20),

                    //email text field
                    MyTextField(controller: emailTextController, hint: 'Email', obscureText: false),
                    const SizedBox(height: 20),

                    //password
                    MyTextField(controller: passwordTextController, hint: 'Password', obscureText: true),
                    const SizedBox(height: 20),

                    MyButton(
                        onTap: signIn,
                        text: 'Sign In'
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not member ?  '),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text('Register now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue
                            ),
                          ),
                        ),
                      ],
                    ),





                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

