// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Home/bar.dart';
// import '../LogIn/log_in.dart';

// class SignUp2 extends StatefulWidget {
//   const SignUp2({super.key});

//   @override
//   State<SignUp2> createState() => _SignUp2State();
// }

// class _SignUp2State extends State<SignUp2> {
//   final _username = TextEditingController();
//   final _password = TextEditingController();
//   final _confirmPassword = TextEditingController();
//   bool _isvisible1 = false;
//   bool _isvisible2 = false;
//   bool _isaccepted = false;

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: const Text('Invalid input'),
//         content:
//             const Text('Please make sure all fields are filled correctly.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(ctx),
//             child: const Text('Okay'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(
//       String label, String placeholder, TextEditingController controller,
//       {bool isPassword = false, bool isConfirmPassword = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             color: Color(0xff1B225B),
//             fontSize: 24,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 5),
//         CupertinoTextField(
//           cursorColor: const Color(0xff1B225B),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           placeholder: placeholder,
//           placeholderStyle: const TextStyle(color: Colors.grey, fontSize: 14),
//           obscureText: isPassword
//               ? !_isvisible1
//               : isConfirmPassword
//                   ? !_isvisible2
//                   : false,
//           keyboardType: TextInputType.visiblePassword,
//           controller: controller,
//           suffix: isPassword || isConfirmPassword
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       if (isPassword) {
//                         _isvisible1 = !_isvisible1;
//                       } else {
//                         _isvisible2 = !_isvisible2;
//                       }
//                     });
//                   },
//                   icon: Icon(
//                     (isPassword ? _isvisible1 : _isvisible2)
//                         ? Icons.visibility_outlined
//                         : Icons.visibility_off_outlined,
//                     color: const Color(0xff001A72),
//                   ),
//                 )
//               : null,
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
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
//                   bottom: MediaQuery.of(context)
//                       .viewInsets
//                       .bottom, // Adjust for keyboard
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
//                       color: const Color.fromARGB(
//                           255, 140, 228, 230), // Same color as Login page
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
//                             _buildTextField('Username', 'Enter Your Username',
//                                 _username),
//                             _buildTextField('Password', 'Enter Your Password',
//                                 _password,
//                                 isPassword: true),
//                             _buildTextField(
//                                 'Confirm Password',
//                                 'Confirm Your Password',
//                                 _confirmPassword,
//                                 isConfirmPassword: true),
//                             const SizedBox(height: 15),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _isaccepted = !_isaccepted;
//                                     });
//                                   },
//                                   icon: _isaccepted
//                                       ? const Icon(
//                                           Icons.check_circle_outline_outlined,
//                                           color: Colors.green)
//                                       : const Icon(Icons.circle_outlined),
//                                 ),
//                                 const Text(
//                                   'I accept the policy and terms.',
//                                   style: TextStyle(
//                                     color: Color(0xff383636),
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 try {
//                                   if (_username.text.trim().isEmpty ||
//                                     _password.text.trim().isEmpty ||
//                                     _confirmPassword.text
//                                         .trim()
//                                         .isEmpty ||
//                                     !_isaccepted ||
//                                     _password.text.trim() !=
//                                         _confirmPassword.text
//                                             .trim()) {
//                                   _showDialog();
//                                 } else 
//                                   final credential = await FirebaseAuth.instance
//                                       .createUserWithEmailAndPassword(
//                                     email: _username.text.trim(),
//                                     password: _password.text.trim(),
//                                   );
//                                   Navigator.of(context).pushReplacementNamed('/home');
//                                 } on FirebaseAuthException catch (e) {
//                                   if (e.code == 'weak-password') {
//                                     print('===========The password provided is too weak.');
//                                   } else if (e.code == 'email-already-in-use') {
//                                     print(
//                                         '=================The account already exists for that email.');
//                                   } 
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                                 // if (_usernameController.text.trim().isEmpty ||
//                                 //     _passwordController.text.trim().isEmpty ||
//                                 //     _confirmPasswordController.text
//                                 //         .trim()
//                                 //         .isEmpty ||
//                                 //     !_isaccepted ||
//                                 //     _passwordController.text.trim() !=
//                                 //         _confirmPasswordController.text
//                                 //             .trim()) {
//                                 //   _showDialog();
//                                 // } else {
//                                 //   Navigator.pushReplacement(
//                                 //     context,
//                                 //     MaterialPageRoute(
//                                 //         builder: (context) =>
//                                 //             const BasePageLayout()),
//                                 //   );
//                                 // }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(double.infinity,
//                                     50), // Consistent button size
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: const Color(0xff259fa2),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Next',
//                                 style: TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight
//                                         .w500), // Consistent font size
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
//                                       MaterialPageRoute(
//                                           builder: (context) => const LogIn()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Log in',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize:
//                                           18, // Consistent font size with LogIn page
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
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Home/bar.dart';
// import '../LogIn/log_in.dart';

// class SignUp2 extends StatefulWidget {
//   const SignUp2({super.key});

//   @override
//   State<SignUp2> createState() => _SignUp2State();
// }

// class _SignUp2State extends State<SignUp2> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//   bool _isAccepted = false;

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(ctx),
//             child: const Text('Okay'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _signUp() async {
//     if (_emailController.text.trim().isEmpty ||
//         _passwordController.text.trim().isEmpty ||
//         _confirmPasswordController.text.trim().isEmpty ||
//         !_isAccepted ||
//         _passwordController.text.trim() != _confirmPasswordController.text.trim()) {
//       _showErrorDialog('Please fill all fields correctly.');
//       return;
//     }

//     try {
//       final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
      
//       await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
//         'email': _emailController.text.trim(),
//       });

//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const BasePageLayout()));
//     } on FirebaseAuthException catch (e) {
//       _showErrorDialog(e.message ?? 'An error occurred.');
//     }
//   }

//   Widget _buildTextField(String label, String placeholder, TextEditingController controller,
//       {bool isPassword = false, bool isConfirmPassword = false}) {
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
//           obscureText: isPassword ? !_isPasswordVisible : (isConfirmPassword ? !_isConfirmPasswordVisible : false),
//           controller: controller,
//           suffix: isPassword || isConfirmPassword
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       if (isPassword) {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       } else {
//                         _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                       }
//                     });
//                   },
//                   icon: Icon(
//                     (isPassword ? _isPasswordVisible : _isConfirmPasswordVisible)
//                         ? Icons.visibility_outlined
//                         : Icons.visibility_off_outlined,
//                     color: const Color(0xff001A72),
//                   ),
//                 )
//               : null,
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Image.asset('assets/images/upvector.jpg', width: double.infinity, fit: BoxFit.cover),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Sign Up',
//                       style: TextStyle(color: Color(0xff259fa2), fontSize: 44, fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 20),
//                     Card(
//                       color: const Color.fromARGB(255, 140, 228, 230),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             _buildTextField('Email', 'Enter Your Email', _emailController),
//                             _buildTextField('Password', 'Enter Your Password', _passwordController, isPassword: true),
//                             _buildTextField('Confirm Password', 'Confirm Your Password', _confirmPasswordController, isConfirmPassword: true),
//                             const SizedBox(height: 15),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       _isAccepted = !_isAccepted;
//                                     });
//                                   },
//                                   icon: _isAccepted
//                                       ? const Icon(Icons.check_circle_outline_outlined, color: Colors.green)
//                                       : const Icon(Icons.circle_outlined),
//                                 ),
//                                 const Text('I accept the policy and terms.', style: TextStyle(color: Color(0xff383636), fontSize: 14)),
//                               ],
//                             ),
//                             ElevatedButton(
//                               onPressed: _signUp,
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(double.infinity, 50),
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: const Color(0xff259fa2),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                               ),
//                               child: const Text('Next', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Image.asset('assets/images/downvector.jpg', width: double.infinity, fit: BoxFit.cover),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class SignUp2 extends StatefulWidget {
//   final String firstName;
//   final String lastName;
//   final String phone;

//   const SignUp2({super.key, required this.firstName, required this.lastName, required this.phone});

//   @override
//   State<SignUp2> createState() => _SignUp2State();
// }

// class _SignUp2State extends State<SignUp2> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _registerUser() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim(),
//         );
//         await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//           'firstName': widget.firstName,
//           'lastName': widget.lastName,
//           'phone': widget.phone,
//           'email': _emailController.text.trim(),
//           'uid': userCredential.user!.uid,
//         });
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BasePageLayout()));
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message ?? 'Registration failed')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Image.asset('assets/images/upvector.jpg', width: double.infinity, fit: BoxFit.cover),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildTextField('Email', 'Enter your email', _emailController, keyboardType: TextInputType.emailAddress),
//                       _buildTextField('Password', 'Enter your password', _passwordController, isPassword: true),
//                       _buildTextField('Confirm Password', 'Confirm your password', _confirmPasswordController, isPassword: true),
//                       ElevatedButton(onPressed: _registerUser, child: const Text('Sign Up')),
//                     ],
//                   ),
//                 ),
//               ),
//               Image.asset('assets/images/downvector.jpg', width: double.infinity, fit: BoxFit.cover),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, String placeholder, TextEditingController controller, {bool isPassword = false, TextInputType keyboardType = TextInputType.text}) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: keyboardType,
//       validator: (value) {
//         if (value!.isEmpty) return '$label cannot be empty';
//         if (label == 'Confirm Password' && value != _passwordController.text) return 'Passwords do not match';
//         return null;
//       },
//       decoration: InputDecoration(labelText: label, hintText: placeholder, border: OutlineInputBorder()),
//     );
//   }
// }
