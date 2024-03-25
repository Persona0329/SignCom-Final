import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Colors.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Options.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Questionares.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/botton.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/result.dart';

class Quiz_1 extends StatefulWidget {
  const Quiz_1({Key? key});

  @override
  State<Quiz_1> createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz_1> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'Identify the letter in the Photo.',
      options: {'A': false, 'B': false, 'C': true, 'D': false},
      imageUrl: 'assets/Letters/Letter_C.jpg', 
    ),
    Question(
      id: '12',
      title: 'Identify the letter in the Photo.',
      options: {'A': true, 'B': false, 'C': false, 'D': false},
      imageUrl: 'assets/Letters/Letter_A.jpg', 
    ),
    Question(
      id: '13',
      title: 'Identify the letter in the Photo.',
      options: {'X': false, 'P': false, 'J': true, 'L': false},
      imageUrl: 'assets/Letters/Letter_J.jpg', 
    ),
    Question(
      id: '14',
      title: 'Identify the letter in the Photo.',
      options: {'Q': true, 'Z': false, 'Y': false, 'T': false},
      imageUrl: 'assets/Letters/Letter_Q.jpg', 
    ),
    Question(
      id: '15',
      title: 'Identify the letter in the Photo.',
      options: {'M': false, 'N': true, 'O': false, 'P': false},
      imageUrl: 'assets/Letters/Letter_N.jpg', 
    ),
    Question(
      id: '16',
      title: 'Identify the letter in the Photo.',
      options: {'U': false, 'W': false, 'Y': true, 'Z': false},
      imageUrl: 'assets/Letters/Letter_Y.jpg', 
    ),
    Question(
      id: '17',
      title: 'Identify the letter in the Photo.',
      options: {'T': false, 'O': false, 'K': false, 'S': true},
      imageUrl: 'assets/Letters/Letter_S.jpg', 
    ),
    Question(
      id: '18',
      title: 'Identify the letter in the Photo.',
      options: {'M': true, 'G': false, 'F': false, 'I': false},
      imageUrl: 'assets/Letters/Letter_M.jpg', 
    ),
    Question(
      id: '19',
      title: 'Identify the letter in the Photo.',
      options: {'F': true, 'J': false, 'E': false, 'O': false},
      imageUrl: 'assets/Letters/Letter_F.jpg', 
    ),
    Question(
      id: '20',
      title: 'Identify the letter in the Photo.',
      options: {'W': false, 'Q': false, 'R': false, 'U': true},
      imageUrl: 'assets/Letters/Letter_U.jpg', 
    ),
  ];
  final audioCache = AudioCache();
  final player = AudioPlayer();
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
        ),
      );
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isScored = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please select any options'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    }
  }

  Future<void> checkAnswer(bool value) async {
    if (isScored) {
      return;
    } else {
      if (value == true) {
        score++;
        player.play(AssetSource('Correct.mp3'));
      } else {
        player.play(AssetSource('Incorrect.mp3'));
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
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
              question: _questions[index].title,
              totalQuestion: _questions.length,
              imageUrl: _questions[index].imageUrl,
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswer(_questions[index].options.values.toList()[i]),
                child: OptionC(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
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

class QuestionWidget extends StatelessWidget {
  final int indexAction;
  final String question;
  final int totalQuestion;
  final String imageUrl;

  const QuestionWidget({
    Key? key,
    required this.indexAction,
    required this.question,
    required this.totalQuestion,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageUrl.isNotEmpty) 
          Container(
            width: MediaQuery.of(context).size.width, 
            height: 200, 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey, 
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain, 
              ),
            ),
          ), 
        SizedBox(height: 10), 
        Text(
          'Question ${indexAction + 1}/$totalQuestion: $question',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ],
    );
  }
}
