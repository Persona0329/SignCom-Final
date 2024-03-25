import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signcom/User_Login/Login_Form.dart';

class AccountDetailPage extends StatefulWidget {
  final User currentUser;

  const AccountDetailPage({required this.currentUser});

  @override
  _AccountDetailPageState createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  File? _imageFile;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.currentUser.email ?? "";

    // Initialize Shared Preferences
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
      });
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _requestEmailChange(String newEmail) async {
    try {
      await widget.currentUser.verifyBeforeUpdateEmail(newEmail);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('A verification email has been sent to $newEmail. Please follow the instructions to complete the email change.')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to request email change: $error')));
    }
  }

  Future<void> _changePassword(String newPassword) async {
    try {
      await widget.currentUser.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password changed successfully')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to change password: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : (widget.currentUser.photoURL != null
                              ? NetworkImage(widget.currentUser.photoURL!)
                              : AssetImage('assets/placeholder_image.jpg') as ImageProvider),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email: ${widget.currentUser.email}',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      _emailController.text = widget.currentUser.email ?? "";
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Request Email Change'),
                            content: TextField(
                              controller: _emailController,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _requestEmailChange(_emailController.text);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Request Change'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password: ********', // Display asterisks for security
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      _passwordController.clear();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Change Password'),
                            content: TextField(
                              controller: _passwordController,
                              obscureText: true,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _changePassword(_passwordController.text);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Change Password'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
