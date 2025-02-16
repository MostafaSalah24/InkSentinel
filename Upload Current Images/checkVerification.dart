import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inksentinel/upload.dart/scancurr.dart';
import '../Home/bar.dart';

class Selectedcurr extends StatefulWidget {
  final String imagePath;
  final String originalImagePath; // Receive original image path

  const Selectedcurr({super.key, required this.imagePath, required this.originalImagePath});

  @override
  State<Selectedcurr> createState() => _SelectedcurrState();
}

class _SelectedcurrState extends State<Selectedcurr> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Result'),
        content: const Text('The result is fake'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BasePageLayout()),
              );
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference results = FirebaseFirestore.instance.collection('Results');

     Future<void> addResult() async {
    CollectionReference results = FirebaseFirestore.instance.collection('Results');

    try {
      await results.add({
        'originalImage': widget.originalImagePath, // Store original image path
        'currentImage': widget.imagePath, // Store current image path
        'result': 'Valid',
        'date': DateTime.now().toIso8601String(),
      });
      print("Data successfully added");
    } catch (error) {
      print("Failed to add data: $error");
    }
  }


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verification',
          style: TextStyle(fontSize: 24, color: Colors.white),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (ctx) => Wrap(
                        children: [Scancurr(originalImagePath: widget.originalImagePath)],
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
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      _showDialog();
                      await addResult();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      backgroundColor: const Color(0xff259FA2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
