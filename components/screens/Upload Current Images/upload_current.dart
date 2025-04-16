import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inksentinel/components/screens/upload.dart/scancurr.dart';

class VCurrent extends StatefulWidget {
  final String originalImagePath;
  final File imageFile;
  const VCurrent({super.key, required this.originalImagePath, required this.imageFile});

  @override
  State<VCurrent> createState() => _VCurrentState();
}

class _VCurrentState extends State<VCurrent> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Please Upload Current Signature',
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w700,
              color: Color(0xff259FA2)
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: const Color(0xffE6F5F5), // Lighter background for better contrast
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5, // Add shadow for better separation
            child: const SizedBox(
              height: 250, // Height of the card, adjust as needed
              width: double.infinity, // Make card take the full width
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.image_outlined, // Icon to signify image upload
                  size: 100, // Scale the icon to make it bigger
                  color: Color(0xff259FA2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 328,
            height: 64,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Ensures dynamic height
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (ctx) => Wrap(
                    children: [Scancurr(originalImagePath: widget.originalImagePath,imageFile: widget.imageFile,)],
                  ),
                  // builder: (ctx) => const Wrap(
                  //   children: [ScanTestd('current')],
                  // ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff259FA2), // Consistent with color scheme
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Upload Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, // Text size for the button
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
