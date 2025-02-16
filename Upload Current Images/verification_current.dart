import 'package:flutter/material.dart';

import 'upload_current.dart';


class VerificationCurrent extends StatelessWidget {
   final String originalImagePath;
  const VerificationCurrent({super.key, required this.originalImagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Verification',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff259FA2),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VCurrent(originalImagePath: originalImagePath), // Your original content
          ],
        ),
      ),
    );
  }
}

