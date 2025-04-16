import 'dart:io';

import 'package:flutter/material.dart';

import 'upload_current.dart';


class VerificationCurrent extends StatefulWidget {
  final String originalImagePath;
  final File imageFile;
  const VerificationCurrent({super.key, required this.originalImagePath, required this.imageFile});

  @override
  State<VerificationCurrent> createState() => _VerificationCurrentState();
}

class _VerificationCurrentState extends State<VerificationCurrent> {
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
            VCurrent(originalImagePath: widget.originalImagePath ,imageFile: widget.imageFile,), // Your original content
          ],
        ),
      ),
    );
  }
}

