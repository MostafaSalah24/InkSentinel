import 'package:flutter/material.dart';
import '../LogIn/log_in.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button & Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Simply navigate to the login screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LogIn()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Instructions Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Don’t worry! It happens. Please enter your email and phone number, and we will send an OTP to verify your identity.',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),

              // Forgot Password Illustration
              Center(
                child: Image.asset(
                  'assets/images/forgetphoto.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),

              // Input Fields (Email and Phone)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Email Input Field
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email Address',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter Your Email Address',
                        hintStyle: const TextStyle(color: Color.fromARGB(200, 200, 200, 200)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),

                    // Phone Number Input Field
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Enter Your Phone Number',
                        hintStyle: const TextStyle(color: Color.fromARGB(200, 200, 200, 200)),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30),

                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: switchScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(37, 159, 162, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Bottom Image Decoration
              Image.asset(
                'assets/images/downvector.jpg',
                width: double.infinity,
                height: 80,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
