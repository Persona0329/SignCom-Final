import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signcom/Pages/Lessons/Lesson_1.dart';
import 'package:signcom/Pages/Lessons/Lesson_2.dart';

// Import the AccountDetailPage

class LessonsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PressableRoundedCorner(
              label: 'Lesson 1: Basic Alphabetics Hand Sign',
              onPressed: () {
                    Navigator.push( 
                      context,
                      MaterialPageRoute(builder: (context) => Lesson1()),
                    );
                  },
            ),
            SizedBox(height: 40),
            PressableRoundedCorner(
              label: 'Lesson 2: Basic Numbers Hand Sign',
              onPressed: () {
                   Navigator.push( 
                      context,
                      MaterialPageRoute(builder: (context) => Lesson2()),
                    );
                  },
            ),
            SizedBox(height: 40),
            PressableRoundedCorner(
              label: 'Corner 3',
              onPressed: () {
                // Add your specific action for Corner 3 here
                print('Corner 3 pressed!');
              },
            ),
            SizedBox(height: 40),
            PressableRoundedCorner(
              label: 'Corner 4',
              onPressed: () {
                // Add your specific action for Corner 4 here
                print('Corner 4 pressed!');
              },
            ),
            SizedBox(height: 40),
            PressableRoundedCorner(
              label: 'Corner 5',
              onPressed: () {
                // Add your specific action for Corner 5 here
                print('Corner 5 pressed!');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PressableRoundedCorner extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PressableRoundedCorner({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: displayWidth * 0.8,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 255, 163, 1), // Customize the corner's color
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: displayWidth * 0.05,
          ),
        ),
      ),
    );
  }
}