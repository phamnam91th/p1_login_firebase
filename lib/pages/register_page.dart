import 'package:flutter/material.dart';
import 'package:p1_login_firebase/components/button.dart';
import 'package:p1_login_firebase/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p1_login_firebase/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});


  @override
  State<RegisterPage> createState() {
    return _RegisterPageState();
  }

}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context)=> const Center(
          child: CircularProgressIndicator(),
        )
    );

    if(passwordTextController.text != confirmPasswordTextController.text) {
      Navigator.pop(context);
      displayMessage("Password don't match!");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
      if(context.mounted) Navigator.pop(context);
      displayMessage("Create user successfully");
      // if(context.mounted) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => const LoginPage(),
      // ));
      // }
    } on FirebaseAuthException catch(e) {
      Navigator.pop(context);
      displayMessage(e.code);
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
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    //logo
                    const Icon(Icons.lock, size: 80),

                    const SizedBox(height: 20),

                    //Welcome text
                    const Text('Lotus Calendar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 20),

                    //email text field
                    MyTextField(controller: emailTextController,
                        hint: 'Email',
                        obscureText: false),
                    const SizedBox(height: 20),

                    //password
                    MyTextField(controller: passwordTextController,
                        hint: 'Password',
                        obscureText: true),
                    const SizedBox(height: 20),

                    //password
                    MyTextField(controller: confirmPasswordTextController,
                        hint: 'Confirm Password',
                        obscureText: true),
                    const SizedBox(height: 20),

                    MyButton(
                        onTap: signUp,
                        text: 'Sign Up'
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?  '),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text('Login now',
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

