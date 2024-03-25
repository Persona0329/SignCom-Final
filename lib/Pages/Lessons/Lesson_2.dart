import 'package:flutter/material.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({Key? key}) : super(key: key);

  @override
  State<Lesson2> createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {
  bool lessonFinished = false; // Add a boolean variable to track lesson completion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), 
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
          automaticallyImplyLeading: true, 
          iconTheme: IconThemeData(color: Colors.white), 
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
                          text: 'Lesson 2 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                        TextSpan(
                          text: 'of our sign language course! We\'re diving into the fascinating world of basic number hand signs. Just as in spoken languages where we have numbers, sign language also has its own numerical system expressed through hand movements.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), 
                  Text(
                    'In this lesson, we\'ll explore these main areas:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10), 
                  _buildBulletPoint('Basic number hand signs: Learning how numbers are represented in sign language'),
                  _buildBulletPoint('Handshapes for each number: Understanding the unique hand configurations for numerical concepts.'),
                  _buildBulletPoint('Strengthening comprehension and mastery.'),
                  _buildBulletPoint('Emphasizing clear communication'),
                  SizedBox(height: 20), 
                  Column(
                    children: [
                      Image.asset(
                        'assets/basicnumbers.jpg', 
                        fit: BoxFit.cover, 
                      ),
                      SizedBox(height: 10), 
                      Text(
                        'Numbers in Sign Language',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), 
                  if (!lessonFinished) 
                    ElevatedButton(
                      onPressed: () {
                        _finishLesson(context);
                      },
                      child: Text('Finish Lesson'),
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
    setState(() {
      lessonFinished = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You have finished your second lesson. Quiz 2 is now unlocked.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
