import 'package:flutter/material.dart';

import '../Change pass/design.dart';
import '../Home/bar.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const BasePageLayout()),),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          iconSize: 24,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(21, 183, 186, 1),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: const Design(), // Show the selected page
    );
  }
}
