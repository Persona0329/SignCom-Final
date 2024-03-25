import 'package:flutter/material.dart';
import 'package:signcom/Pages/Home.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({Key? key}) : super(key: key);

  @override
  State<Lesson3> createState() => _Lesson1State();
}

class _Lesson1State extends State<Lesson3> {
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
                          text: 'Lesson 3 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Make "Lesson 1" bold
                          ),
                        ),
                        TextSpan(
                          text: 'of our sign language course! Today, we\'re focusing on understanding gestures and using polite expressions in sign language. Gestures convey emotions that enhance communication, while polite expressions ensure respectful interactions. Are you ready to learn a new way to express yourself?',
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
                  _buildBulletPoint('Learning different gestures and polite way to do it'),
                  _buildBulletPoint('Mastering polite expressions for respectful communication'),
                  _buildBulletPoint('Practice exercises to reinforce understanding'),
                  SizedBox(height: 20), // Adding some space between text and other content
                  Column(
                    children: [
                      Image.asset(
                        'assets/alphabetics.jpg', // Provide the path to your image
                        fit: BoxFit.cover, // Adjust how the image fits the space
                      ),
                      SizedBox(height: 10), // Adding some space between image and text
                      Text(
                        'Greetings and Polite Expressions in Sign Language',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action when the button is pressed
                      _finishLesson(context);
                    },
                    child: Text('Finish Lesson'),
                  ),
                  SizedBox(height: 20), // Adding some space between button and other content
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
          content: Text('You have finished your third lesson.'),
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
