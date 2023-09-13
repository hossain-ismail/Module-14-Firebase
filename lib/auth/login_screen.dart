import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:module_14_class_1_firebase/firestore_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Successfull"),
        ),
      );
      //clear the cotroller
      emailController.clear();
      passwordController.clear();
      //go to login screen
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return FireStoreData();
      }), (route) => false);
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign in Failed! Tray again"),
        ),
      );
    });
    //using getx
    /*    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Login success',
        message: ' ',
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ));
      //Get.to(LoginScreen2());
    }).onError((error, stackTrace) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Login Failed',
        message: ' ',
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ));
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (String? value) {
                    if (value?.trim()?.isEmpty ?? true) {
                      return 'Enter email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Email', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  validator: (String? value) {
                    if (value?.trim()?.isEmpty ?? true) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _obscureText = !_obscureText;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: _obscureText
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Sign In'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
