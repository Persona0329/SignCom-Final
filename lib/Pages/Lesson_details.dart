import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signcom/Pages/Lessons/Lesson_1.dart';
import 'package:signcom/Pages/Lessons/Lesson_2.dart';
import 'package:signcom/Pages/Lessons/Lesson_3.dart';

class LessonsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: SingleChildScrollView(
        child: Center(
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
                label: 'Lesson 3: Greetings and Polite Expressions',
                onPressed: () {
                  Navigator.push( 
                    context,
                    MaterialPageRoute(builder: (context) => Lesson3()),
                  );
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
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final Color iconColor;

  const BottomBarButton({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double buttonWidth = displayWidth * 0.18;

    if (currentIndex == index) {
      buttonWidth = displayWidth * 0.32;
    }

    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: buttonWidth,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: currentIndex == index ? displayWidth * 0.12 : 0,
              width: currentIndex == index ? displayWidth * 0.32 : 0,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Color.fromRGBO(0, 255, 163, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: buttonWidth,
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: displayWidth * 0.076,
              color: iconColor, // Use the original icon color
            ),
          ),
        ],
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
          color: Color.fromRGBO(0, 255, 163, 1),
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
