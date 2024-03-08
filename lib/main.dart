// ignore_for_file: duplicate_import, prefer_const_constructors

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signcom/Pages/Home.dart';
import 'package:signcom/User_Login/SplashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
              apiKey: 'AIzaSyAnGgct6_zE6sL9Wuwcn_rAC3Ag5M9Fa-I',
              appId: '1:657634229937:android:0ab8f4b73a68f3f9deac90',
              messagingSenderId: '657634229937',
              projectId: 'signcom-official',
            ),
          )
        : await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignCom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // Define routes
        '/': (context) => SplashScreen(), // Define the SplashScreen route
        '/home': (context) => HomePage(), // Define the HomePage route
        // Add other routes as needed
      },
    );
  }
}