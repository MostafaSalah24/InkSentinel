import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  const Design({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
          0xFFF1F1F1), // Lighter background color matching app's theme
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name
              _buildTextField('First Name', 'Amr', TextInputType.name),

              const SizedBox(height: 18),

              // Last Name
              _buildTextField('Last Name', 'Ashraf', TextInputType.name),

              const SizedBox(height: 18),

              // Phone number / Email
              _buildTextField(
                  'Phone number/Email', '0101*7*4', TextInputType.phone),

              const SizedBox(height: 35),

              // Save Button
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for text fields with consistent styling
  Widget _buildTextField(
      String label, String placeholder, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff1b225b),
            fontFamily: 'PontanoSans-Medium', // Use consistent app font
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        CupertinoTextField(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          placeholder: placeholder,
          placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          style: const TextStyle(fontSize: 16),
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  // Save Button widget with consistent design
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Save functionality goes here
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: const Color.fromRGBO(
              21, 183, 186, 1), // Match the app accent color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        child: const Text(
          'Save',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
