import 'package:flutter/material.dart';
import 'package:module_14_class_1_firebase/auth/register_screen_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextPage();
    super.initState();
  }

  void goToNextPage() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return RegisterScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Firebase',
              style: TextStyle(
                  color: const Color.fromARGB(255, 245, 130, 32), fontSize: 30),
            ),
            Image.asset("assets/images/images.png"),
          ],
        ),
      ),
    );
  }
}
