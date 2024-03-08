
import 'package:flutter/material.dart';
import 'package:signcom/Pages/Home.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Colors.dart';


class ResultB extends StatelessWidget {
  const ResultB({Key? key,
  required this.result,
  required this.questionLength,
  required this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding:  const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Result",
            style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,  
            ),
            ),
            const SizedBox(height:20.0),
            CircleAvatar(
              child: Text('$result/$questionLength',
              style: TextStyle(
                fontSize: 23.0
                ) ,
              ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                ? Colors.blue // half score
                : result < questionLength / 2
                ? incorrect // less than half score
                : correct, // more than half score
            ),
            const SizedBox(height: 20.0),
            Text(result == questionLength / 2
                ? 'Almost There' 
                : result < questionLength / 2
                ? 'Wanna Try Again?' 
                : 'Very Good', 
              style: const TextStyle(color:Colors.white, fontSize: 15.0),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: const Text('Restart Quiz?',
                style: TextStyle(
                  color: Color.fromRGBO(0, 255, 163, 1),  
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: () {
                Navigator.push( 
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
              },
              child: const Text('Finish Quiz',
                style: TextStyle(
                  color: Color.fromRGBO(0, 255, 163, 1),  
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}