import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/screens/Forget password/forgetpage.dart';
import 'components/screens/Home/bar.dart';
import 'components/screens/LogIn/log_in.dart';
import 'components/screens/Sign up/sign_up.dart';
import 'components/screens/splash/splash_content.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("🔥 Firebase Initialization Error: $e");
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/forgot': (context) => const Forgetpage(),
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const BasePageLayout(),
      },
    );
  } 
}

