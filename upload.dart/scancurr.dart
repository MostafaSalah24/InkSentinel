import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../Upload Current Images/checkVerification.dart';

class Scancurr extends StatefulWidget {
  // final String select;
  final String originalImagePath;
  const Scancurr({super.key, required this.originalImagePath});
  @override
  State<Scancurr> createState() => _ScancurrState();
}

class _ScancurrState extends State<Scancurr> {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? xFile = await _imagePicker.pickImage(source: source);
      if (xFile == null) {
        _showSnackBar('No image selected.');
        return;
      }

      final File savedImage = await _saveImageLocally(File(xFile.path));

      if (mounted) Navigator.pop(context);

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) {
            return Selectedcurr(imagePath: savedImage.path, // Replace with actual path
                  originalImagePath: widget.originalImagePath);
          }),
        );
      }
    } catch (e) {
      _showSnackBar('Error picking image: $e');
    }
  }

  Future<File> _saveImageLocally(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final newPath = "${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";
    return image.copy(newPath);
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton('Gallery', () => _pickImage(ImageSource.gallery), Colors.blueAccent),
          const SizedBox(height: 10),
          _buildButton('Scan', () => _pickImage(ImageSource.camera), Colors.green),
          const SizedBox(height: 10),
          _buildButton('Cancel', () => Navigator.pop(context), Colors.red),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
    );
  }
}
