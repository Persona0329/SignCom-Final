import 'package:flutter/material.dart';
import 'package:signcom/Pages/Quiz/Quiz1.dart';
import 'package:signcom/Pages/Quiz/Quiz2.dart';

class TaskDetailPage extends StatefulWidget {
  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  bool lessonFinished = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PressableRoundedCorner(
                label: 'Quiz 1: Basic Alphabetics',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz_1()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Lesson Not Finished'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
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
                },
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PressableRoundedCorner(
                label: 'Quiz 2: Basic Numbers',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Quiz_2()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Lesson Not Finished'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
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
                },
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PressableRoundedCorner(
                label: 'Quiz 3',
                onPressed: () {
                  // Similar logic for Quiz 3
                },
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PressableRoundedCorner(
                label: 'Quiz 4',
                onPressed: () {
                  // Similar logic for Quiz 4
                },
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: PressableRoundedCorner(
                label: 'Quiz 5',
                onPressed: () {
                  // Similar logic for Quiz 5
                },
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class PressableRoundedCorner extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

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
