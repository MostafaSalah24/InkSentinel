// import 'package:first_test/bottom_bar.dart';
import 'package:flutter/material.dart';

import '../verification/verification.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: width<400? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/banner.png',
            // width: double.infinity,
            height: 300,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Column(
                children: [
                  const Text(
                    'Make sure your signatures are correct.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'This app scans signatures and ensures their authenticity and safety',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Verification(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(21, 183, 186, 1),
                        minimumSize: const Size(800, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text(
                      'signature verification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ):Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Home (2).png',
            // width: double.infinity,
            height: 300,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Column(
                children: [
                  const Text(
                    'Make sure your signatures are correct.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'This app scans signatures and ensures their authenticity and safety',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Verification(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(21, 183, 186, 1),
                        minimumSize: const Size(800, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: const Text(
                      'signature verification',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
