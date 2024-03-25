import 'package:flutter/material.dart';
import 'package:signcom/Pages/Home.dart';
import 'package:signcom/Pages/Quiz/Quiz1.dart';

class Lesson1 extends StatefulWidget {
  const Lesson1({Key? key}) : super(key: key);

  @override
  State<Lesson1> createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson1> {
  bool lessonFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Adjust the height of the app bar as needed
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            'assets/logo2.png',
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          automaticallyImplyLeading: true, // Make the back button visible
          iconTheme: IconThemeData(color: Colors.white), // Set the color of the back button to white
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome to ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Lesson 1 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Make "Lesson 1" bold
                          ),
                        ),
                        TextSpan(
                          text: 'of our sign language course! Today, we\'re diving into the world of basic alphabetic hand signs. Just like spoken languages have their own alphabet, sign language does too. But instead of letters, we communicate with our hands. Are you ready to learn a new way to express yourself?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Adding some space between text and other content
                  Text(
                    'In this lesson, we\'ll explore these main areas:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10), // Adding some space between text and other content
                  // Bullet points
                  _buildBulletPoint('Introduction to the manual alphabet'),
                  _buildBulletPoint('Learning the handshapes for each letter'),
                  _buildBulletPoint('Practice exercises to reinforce understanding'),
                  _buildBulletPoint('Importance of clear and precise hand movements'),
                  SizedBox(height: 20), // Adding some space between text and other content
                  // Image with text
                  Column(
                    children: [
                      Image.asset(
                        'assets/alphabetics.jpg', // Provide the path to your image
                        fit: BoxFit.cover, // Adjust how the image fits the space
                      ),
                      SizedBox(height: 10), // Adding some space between image and text
                      Text(
                        'Alphabetics in Sign Language',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Adding some space between image and other content
                  // "Finish Lesson" Button
                  ElevatedButton(
                    onPressed: () {
                      // Action when the button is pressed
                      _finishLesson(context);
                    },
                    child: Text('Finish Lesson'),
                  ),
                  SizedBox(height: 20), // Adding some space between button and other content
                  // "Quiz 1" button
                  if (lessonFinished) // Display Quiz 1 button only if lesson is finished
                    PressableRoundedCorner(
                      label: 'Quiz 1',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Quiz_1()),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _finishLesson(BuildContext context) {
    // Perform actions when the lesson is finished
    setState(() {
      lessonFinished = true;
    });

    // Show pop-up message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You have finished your first lesson. Quiz 1 is now unlocked.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class PressableRoundedCorner extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const PressableRoundedCorner({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Color.fromRGBO(0, 255, 163, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: displayWidth * 0.05,
        ),
      ),
    );
  }
}
