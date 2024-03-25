// lib/forgot_password.dart

// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    _showPasswordResetDialog(context);
  }

  // Function to show the password reset success dialog
  Future<void> _showPasswordResetDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Request Successful'),
          content: Text('Check your Email for more info.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white), 
        ),
        iconTheme: IconThemeData(color: Colors.white), 
      ),
      body: Container(
        color: Color.fromRGBO(21, 20, 21, 1),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text(
              'Enter your email to reset your password',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
            ),
            const SizedBox(height: 16.0),
            
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: passwordReset,
              child: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 255, 163, 1),
                onPrimary: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}