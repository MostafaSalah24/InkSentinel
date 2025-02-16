// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../LogIn/log_in.dart';
// import 'sign_up2.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _phoneController = TextEditingController();

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: const Text('Invalid Input'),
//         content: const Text('Please ensure all fields are filled in correctly.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(ctx),
//             child: const Text('Okay'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper method to build the input fields
//   Widget buildTextField(String label, String placeholder, TextEditingController controller, {Widget? suffix, TextInputType? keyboardType}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             color: Color(0xff1B225B),
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 5),
//         CupertinoTextField(
//           cursorColor: const Color(0xff1B225B),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           placeholder: placeholder,
//           placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
//           keyboardType: keyboardType ?? TextInputType.text,
//           controller: controller,
//           suffix: suffix,
//           style: const TextStyle(fontSize: 16, color: Color(0xff1B225B)),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevents layout changes when keyboard appears
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top Image
//             Image.asset(
//               'assets/images/upvector.jpg',
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),

//             // Main Content with ScrollView
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Color(0xff259fa2),
//                         fontSize: 44,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Card(
//                       color: const Color.fromARGB(255, 140, 228, 230), // Same color as Login page
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             buildTextField('First Name', 'Enter Your First Name', _firstNameController),
//                             buildTextField('Last Name', 'Enter Your Last Name', _lastNameController),
//                             buildTextField(
//                               'Phone Number/Email',
//                               'Enter Your Phone Number or Email',
//                               _phoneController,
//                               keyboardType: TextInputType.phone,
//                               suffix: const Icon(Icons.phone_outlined, color: Color(0xff001A72)),
//                             ),
//                             const SizedBox(height: 15),
//                             ElevatedButton(
//                               onPressed: () {
//                                 if (_firstNameController.text.trim().isEmpty ||
//                                     _lastNameController.text.trim().isEmpty ||
//                                     _phoneController.text.trim().isEmpty) {
//                                   _showDialog();
//                                 } else {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => const SignUp2()),
//                                   );
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(double.infinity, 50), // Consistent button size
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: const Color(0xff259fa2),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Next',
//                                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500), // Consistent font size
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   'Already have an account? ',
//                                   style: TextStyle(
//                                     color: Color(0xff1b225b),
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const LogIn()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Log in',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18, // Consistent font size with LogIn page
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Bottom Image
//             Image.asset(
//               'assets/images/downvector.jpg',
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inksentinel/Splash/splash_content.dart';
import '../LogIn/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() {
          _errorMessage = 'The password provided is too weak.';
        });
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          setState(() {
          _errorMessage = 'The account already exists for that email.';
        });
          print('The account already exists for that email.');
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()),
        );
      }
    }
  }

  Widget buildTextField(
      String label, String placeholder, TextEditingController controller,
      {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff1B225B),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        CupertinoTextField(
          cursorColor: const Color(0xff1B225B),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          placeholder: placeholder,
          placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          style: const TextStyle(fontSize: 16, color: Color(0xff1B225B)),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            return value.text.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'This field cannot be empty',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/upvector.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xff259fa2),
                          fontSize: 44,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        color: const Color.fromARGB(255, 140, 228, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildTextField(
                                  'Email', 'Enter Your Email', _emailController,
                                  keyboardType: TextInputType.emailAddress),
                              buildTextField('Password', 'Enter Your Password',
                                  _passwordController,
                                  keyboardType: TextInputType.visiblePassword),
                              if (_errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: _signUp,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xff259fa2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LogIn()),
                                  );
                                },
                                child: const Text(
                                  'Already have an account? Log in',
                                  style: TextStyle(
                                      color: Color(0xff1B225B), fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
}
