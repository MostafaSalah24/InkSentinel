import 'dart:io';
import 'package:flutter/material.dart';

import '../Upload Current Images/verification_current.dart';
import 'scan.dart';

class SelectedOriginal extends StatefulWidget {
  final String imagePath;
  final File imageFile;
  const SelectedOriginal(this.imageFile, this.imagePath, {super.key});

  @override
  State<SelectedOriginal> createState() => _SelectedOriginalState();
}

class _SelectedOriginalState extends State<SelectedOriginal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Images',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff259FA2),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          iconSize: 24,
        ),
      ),
      backgroundColor: const Color(0xfff4f6f9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Please Upload Original Signature',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              // Displaying the selected image with scaling and updated icon
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(widget.imagePath),
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover, // Scales image to cover the container
                ),
              ),
              const SizedBox(height: 20),
              // Change Image Button with a simpler icon
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (ctx) => const Wrap(
                      children: [ScanTestd('original')],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Color(0xff259FA2),
                  size: 30,
                ),
                label: const Text(
                  'Change Image',
                  style: TextStyle(
                    color: Color(0xff259FA2),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Next Button with a rounded design and color update
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationCurrent(originalImagePath: widget.imagePath, imageFile: widget.imageFile,),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: const Color(0xff259FA2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}