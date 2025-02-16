import 'package:flutter/material.dart';

import '../Home/bar.dart';
import 'design.dart';

class Changepass extends StatelessWidget {
  const Changepass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BasePageLayout()), // Replace with your own home page if necessary
          ),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          iconSize: 24,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(21, 183, 186, 1), // App's main color
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: const Design(), // Show the Design widget for changing the password
    );
  }
}
