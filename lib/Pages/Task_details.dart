import 'package:flutter/material.dart';
import 'package:signcom/Pages/Quiz/Quiz1.dart';

class TaskDetailPage extends StatefulWidget {
  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  bool lessonFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Set the width size here
              child: PressableRoundedCorner(
                label: 'Quiz 1',
                onPressed: () {
                  Navigator.push( 
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                },
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // Set the width size here
              child: PressableRoundedCorner(
                label: 'Quiz 2',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                  } else {
                    // Show dialog if lesson is not finished
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
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
              width: MediaQuery.of(context).size.width * 0.8, // Set the width size here
              child: PressableRoundedCorner(
                label: 'Quiz 3',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                  } else {
                    // Show dialog if lesson is not finished
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
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
              width: MediaQuery.of(context).size.width * 0.8, // Set the width size here
              child: PressableRoundedCorner(
                label: 'Quiz 4',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                  } else {
                    // Show dialog if lesson is not finished
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
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
              width: MediaQuery.of(context).size.width * 0.8, // Set the width size here
              child: PressableRoundedCorner(
                label: 'Quiz 5',
                onPressed: () {
                  if (lessonFinished) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                  } else {
                    // Show dialog if lesson is not finished
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('You haven\'t finished the lesson yet.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
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
