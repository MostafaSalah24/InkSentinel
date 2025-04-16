import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import '../Home/bar.dart';

class Selectedcurr extends StatefulWidget {
  final File imageFile;
  final File imageFilecurr;

  const Selectedcurr({
    super.key,
    required this.imageFile,
    required this.imageFilecurr,
  });

  @override
  State<Selectedcurr> createState() => _SelectedcurrState();
}

class _SelectedcurrState extends State<Selectedcurr> {
  bool _isLoading = false;
  // String? _verificationResult;

  Future<void> verifyImages() async {
    if (_isLoading) return; // Prevent multiple calls
    setState(() => _isLoading = true);

    try {
      var uri = Uri.parse("http://192.168.1.8:5000/verify"); // Replace with actual Flask API IP
      var request = http.MultipartRequest("POST", uri);

      // Add image files as multipart data
      request.files.add(await http.MultipartFile.fromPath("original", widget.imageFile.path));
      request.files.add(await http.MultipartFile.fromPath("current", widget.imageFilecurr.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var result = jsonDecode(responseData);

        String status = result['status'] ?? 'Unknown';
        // setState(() => _verificationResult = status);

        // Save result to Firestore
        await addResult(status);
        showResultDialog(status);
      } else {
        showErrorDialog("Server error: ${response.statusCode}");
      }
    } on SocketException {
      showErrorDialog("Network error. Please check your connection.");
    } on HttpException {
      showErrorDialog("Couldn't reach the server. Try again later.");
    } on FormatException {
      showErrorDialog("Invalid response from the server.");
    } catch (e) {
      showErrorDialog("Unexpected error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> addResult(String result) async {
    CollectionReference results = FirebaseFirestore.instance.collection('Results');
    try {
      await results.add({
        'originalImage': widget.imageFile.path,
        'currentImage': widget.imageFilecurr.path,
        'result': result,
        'date': DateTime.now().toIso8601String(),
      });
    } catch (error) {
      showErrorDialog("Failed to save result: $error");
    }
  }

  void showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Verification Result'),
        content: Text(result == 'fake' ? 'The signature is Fake' : 'The signature is Valid'),
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

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
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
                  'Uploaded Signature',
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
                    widget.imageFilecurr,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: verifyImages,
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
