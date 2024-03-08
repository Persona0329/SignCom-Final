// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Colors.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Options.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Questionares.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/botton.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/result.dart';
class Demo extends StatefulWidget {
  const Demo({Key? key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'Identify the letter in the Photo.',
      options: {'A': false, 'B': false, 'C': true, 'D': false},
    ),
    Question(
      id: '11',
      title: 'Identify the letter in the Photo.',
      options: {'A': true, 'Z': false, 'F': false, 'G': false},
    ),
    Question(
      id: '12',
      title: 'Identify the letter in the Photo.',
      options: {'A': false, 'E': false, 'G': false, 'O': true},
    ),
    Question(
      id: '13',
      title: 'Identify the letter in the Photo.',
      options: {'S': false, 'T': false, 'P': true, 'M': false},
    ),
    Question(
      id: '14',
      title: 'Identify the letter in the Photo.',
      options: {'K': true, 'D': false, 'E': false, 'N': false},
    ),
    Question(
      id: '15',
      title: 'Identify the letter in the Photo.',
      options: {'N': false, 'J': true, 'X': false, 'U': false},
    ),
    Question(
      id: '16',
      title: 'Identify the letter in the Photo.',
      options: {'D': false, 'S': false, 'Q': true, 'L': false},
    ),
    Question(
      id: '17',
      title: 'Identify the letter in the Photo.',
      options: {'H': false, 'R': false, 'C': false, 'B': true},
    ),
    Question(
      id: '18',
      title: 'Identify the letter in the Photo.',
      options: {'M': true, 'Y': false, 'Z': false, 'L': false},
    ),
    Question(
      id: '19',
      title: 'Identify the letter in the Photo.',
      options: {'F': false, 'B': false, 'T': true, 'Y': false},
    ),

  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isScored = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultB(
        result: score,
        questionLength: _questions.length,
        onPressed: restart,
      ));
      return;
    } else {
      if(isPressed){
        setState(() {
          index++;
          isPressed = false;
          isScored = false;
      });
      } else  { 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Please select any options'), behavior:
          SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),)
        );
      }
    }
  }

  void checkAnswer (bool value) {
    if (isScored) {
      return;
      } else {
        if (value == true) {
      score++;
      }
    setState(() {
      isPressed = true;
      isScored = true;
        });

    }
  }

  void restart() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isScored = false;
    });
    Navigator.pop(context);
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz 1'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(padding: const EdgeInsets.all(18.0),
          child: Text('Score: $score',
            style: TextStyle(fontSize: 18.0),          
            ),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index]
                    .title,
                totalQuestion: _questions.length,
            ),
            const Divider(color: Colors.grey),

            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
            GestureDetector(
              onTap: () => checkAnswer(_questions[index].options.values.toList()[i]),
              child: OptionC(option: _questions[index].options.keys.toList()[i],
              color: isPressed ? _questions[index].options.values.toList()[i] == true ?  
              correct 
              : incorrect 
              : neutral,
              ),
            ),


          ],
        ),
        ),
        
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: button1(
            nextQuestion: nextQuestion,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }

}
