import 'package:flutter/material.dart';
import 'changepage.dart';
import 'design.dart';

class Forgetpage extends StatefulWidget {
  const Forgetpage({super.key});

  @override
  State<Forgetpage> createState() => _ForgetpageState();
}

class _ForgetpageState extends State<Forgetpage> {
  Widget? activeone;

  @override
  void initState() {
    super.initState();
    activeone = ForgotPasswordScreen(swetichone);
  }

  void swetichone() {
    setState(() {
      activeone =  const ChangePasswordPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForgetPage',
      home: Scaffold(body: activeone),
    );
  }
}
