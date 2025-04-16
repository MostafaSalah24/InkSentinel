import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inksentinel/components/screens/Splash/splash_content.dart';
import '../../widgets/custom_text_field.dart';
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
      setState(
          () => _errorMessage = null); // Reset error message before validation
      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await userCredential.user
            ?.sendEmailVerification(); // Send verification email

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LogIn()),
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          if (e.code == 'weak-password') {
            _errorMessage = 'The password provided is too weak.';
          } else if (e.code == 'email-already-in-use') {
            _errorMessage = 'The account already exists for that email.';
          } else {
            _errorMessage = 'Registration failed. Try again.';
          }
        });
      } catch (e) {
        setState(() => _errorMessage = 'An error occurred. Try again.');
      }
    }
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
                              CustomTextField(
                                label: 'Email',
                                placeholder: 'Enter Your Email',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              CustomTextField(
                                label: 'Password',
                                placeholder: 'Enter Your Password',
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                              ),
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
