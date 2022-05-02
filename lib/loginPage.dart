// ignore_for_file: avoid_print

import 'package:auth_firebase_example/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(33),
          child: Center(
            child: Column(
              children: [
                const Text('Login'),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text('Correo'),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text('Correo'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.lock_open, size: 32),
                  label: const Text('Sign in'),
                  onPressed: singIn,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Registrar'),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  Future singIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),)
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e){
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}