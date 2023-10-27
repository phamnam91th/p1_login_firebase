import 'package:flutter/material.dart';
import 'package:p1_login_firebase/pages/login_page.dart';
import 'package:p1_login_firebase/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() {
    return _LoginOrRegisterState();
  }

}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(onTap: togglePages);
    }else {
      return RegisterPage(onTap: togglePages);
    }
  }

}