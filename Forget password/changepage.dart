import 'package:flutter/material.dart';

import '../LogIn/log_in.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // Top Image
            Image.asset(
              'assets/images/upvector.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    
            // Main Content with ScrollView
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom, // Adjust for keyboard
                ),
                child:
                    // Centered Form
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(37, 238, 178, 0.36),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        const Text(
                          'New Password',
                          style: TextStyle(
                            color: Color(0xFF218785),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
    
                        // New Password Field
                        _buildPasswordField(
                          label: 'New Password',
                          isVisible: isPasswordVisible,
                          onToggle: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
    
                        // Confirm Password Field
                        _buildPasswordField(
                          label: 'Confirm Password',
                          isVisible: isConfirmPasswordVisible,
                          onToggle: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
    
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(37, 159, 162, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    
            // Bottom Image
            Image.asset(
              'assets/images/downvector.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method for Password Field
  Widget _buildPasswordField({
    required String label,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 27, 91, 76),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: !isVisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Enter your $label',
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              color: Colors.grey,
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }
}
