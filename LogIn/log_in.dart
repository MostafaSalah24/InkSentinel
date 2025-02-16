// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Forget password/forgetpage.dart';
// import '../Sign up/sign_up.dart';

// class LogIn extends StatefulWidget {
//   const LogIn({super.key});

//   @override
//   State<LogIn> createState() => _LogInState();
// }

// class _LogInState extends State<LogIn> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isVisible = false;
//   bool _isError = false;

//   // Function to handle error state
//   void _error() {
//     setState(() {
//       _isError = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevent default adjustment
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
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Log In',
//                         style: TextStyle(
//                           color: Color(0xff259fa2),
//                           fontSize: 44,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
                
//                       // Input Card
//                       Card(
//                         color: const Color.fromARGB(255, 140, 228, 230),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               _buildInputField(
//                                 label: 'Username',
//                                 controller: _usernameController,
//                                 placeholder: 'Enter Your Username',
//                                 isPassword: false,
//                                 onSuffixIconPressed: () {},
//                                 suffixIcon: Icons.email_outlined,
//                               ),
//                               const SizedBox(height: 10),
//                               _buildInputField(
//                                 label: 'Password',
//                                 controller: _passwordController,
//                                 placeholder: 'Enter Your Password',
//                                 isPassword: true,
//                                 onSuffixIconPressed: () {
//                                   setState(() {
//                                     _isVisible = !_isVisible;
//                                   });
//                                 },
//                                 suffixIcon: _isVisible
//                                     ? Icons.visibility_outlined
//                                     : Icons.visibility_off_outlined,
//                               ),
//                               const SizedBox(height: 15),
//                               if (_isError)
//                                 const Padding(
//                                   padding: EdgeInsets.only(bottom: 15.0),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.error_outline_outlined,
//                                         color: Colors.red,
//                                         size: 25,
//                                       ),
//                                       SizedBox(width: 5),
//                                       Text(
//                                         'Please enter correct password',
//                                         style: TextStyle(
//                                           color: Colors.red,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   if (_usernameController.text
//                                           .trim()
//                                           .isEmpty ||
//                                       _passwordController.text
//                                           .trim()
//                                           .isEmpty) {
//                                     _error();
//                                   } else {
//                                     Navigator.pushReplacementNamed(
//                                         context, '/splash');
//                                   }
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize:
//                                       const Size(double.infinity, 50),
//                                   foregroundColor: Colors.white,
//                                   backgroundColor: const Color(0xff259fa2),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   'Log In',
//                                   style: TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Center(
//                                 child: TextButton(
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const Forgetpage(),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text(
//                                     'Forgot password?',
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const Text(
//                                     'Don’t have an account?',
//                                     style: TextStyle(
//                                       color: Color(0xff1b225b),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   ),
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pushReplacement(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               const SignUp(),
//                                         ),
//                                       );
//                                     },
//                                     child: const Text(
//                                       'Sign up',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
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

//   // Helper method to build the input fields
//   Widget _buildInputField({
//     required String label,
//     required TextEditingController controller,
//     required String placeholder,
//     required bool isPassword,
//     required VoidCallback onSuffixIconPressed,
//     required IconData suffixIcon,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             color: Color(0xff1b225b),
//             fontSize: 24,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 5),
//         CupertinoTextField(
//           controller: controller,
//           obscureText: isPassword && !_isVisible,
//           placeholder: placeholder,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
          
//           suffix: IconButton(
//             onPressed: onSuffixIconPressed,
//             icon: Icon(
//               suffixIcon,
//               color: const Color(0xff001A72),
//               size: 20,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Forget password/forgetpage.dart';
import '../Sign up/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() => _errorMessage = "Please enter email and password.");
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        setState(() => _errorMessage = "A verification email has been sent. Please check your inbox.");
        return;
      }

      await _auth.currentUser?.reload();
      if (_auth.currentUser?.emailVerified ?? false) {
        Navigator.pushReplacementNamed(context, '/splash');
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _getAuthErrorMessage(e.code));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _getAuthErrorMessage(String errorCode) {
    const errorMessages = {
      'user-not-found': 'No user found for that email.',
      'wrong-password': 'Incorrect password. Try again.',
      'invalid-email': 'Invalid email format.',
    };
    return errorMessages[errorCode] ?? 'Login failed. Please try again.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildImage('assets/images/upvector.jpg'),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          color: Color(0xff259fa2),
                          fontSize: 44,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLoginCard(),
                    ],
                  ),
                ),
              ),
            ),
            _buildImage('assets/images/downvector.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginCard() {
    return Card(
      color: const Color.fromARGB(255, 140, 228, 230),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(
              label: 'Email',
              controller: _emailController,
              placeholder: 'Enter Your Email',
              isPassword: false,
              suffixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 10),
            _buildInputField(
              label: 'Password',
              controller: _passwordController,
              placeholder: 'Enter Your Password',
              isPassword: true,
              suffixIcon: _isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            ),
            const SizedBox(height: 15),
            if (_errorMessage != null) _buildErrorMessage(_errorMessage!),
            _buildLoginButton(),
            const SizedBox(height: 10),
            _buildForgotPassword(),
            _buildSignUpLink(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    required bool isPassword,
    required IconData suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff1b225b),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        CupertinoTextField(
          controller: controller,
          obscureText: isPassword && !_isVisible,
          placeholder: placeholder,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          suffix: IconButton(
            onPressed: () {
              if (isPassword) setState(() => _isVisible = !_isVisible);
            },
            icon: Icon(
              suffixIcon,
              color: const Color(0xff001A72),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _signIn,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff259fa2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: _isLoading
          ? const CupertinoActivityIndicator()
          : const Text(
              'Log In',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          const Icon(Icons.error_outline_outlined, color: Colors.red, size: 25),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgetpage())),
        child: const Text(
          'Forgot password?',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don’t have an account?', style: TextStyle(color: Color(0xff1b225b), fontSize: 15, fontWeight: FontWeight.w300)),
        TextButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp())),
          child: const Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }

  Widget _buildImage(String path) {
    return Image.asset(path, width: double.infinity, fit: BoxFit.cover);
  }
}
