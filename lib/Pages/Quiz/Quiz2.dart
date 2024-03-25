import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Colors.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Options.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/Questionares.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/botton.dart';
import 'package:signcom/Pages/Quiz/Quiz_layout/result.dart';

class Quiz_2 extends StatefulWidget {
  const Quiz_2({Key? key});

  @override
  State<Quiz_2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz_2> {
  List<Question> _questions = [
    Question(
      id: '21',
      title: 'Identify the number in the Photo.',
      options: {'10': false, '40': false, '20': false, '30': true},
      imageUrl: 'assets/Numbers/No30.jpg', 
    ),
    Question(
      id: '22',
      title: 'Identify the number in the Photo.',
      options: {'10': false, '11': true, '12': false, '13': false},
      imageUrl: 'assets/Numbers/No11.jpg', 
    ),
    Question(
      id: '23',
      title: 'Identify the number in the Photo.',
      options: {'20': false, '16': true, '17': false, '19': false},
      imageUrl: 'assets/Numbers/No16.jpg', 
    ),
    Question(
      id: '24',
      title: 'Identify the number in the Photo.',
      options: {'4': true, '5': false, '6': false, '10': false},
      imageUrl: 'assets/Numbers/No4.jpg', 
    ),
    Question(
      id: '25',
      title: 'Identify the number in the Photo.',
      options: {'9': false, '8': true, '3': false, '4': false},
      imageUrl: 'assets/Numbers/No8.jpg', 
    ),
    Question(
      id: '26',
      title: 'Identify the number in the Photo.',
      options: {'30': false, '50': false, '80': false, '70': true},
      imageUrl: 'assets/Numbers/No70.jpg', 
    ),
    Question(
      id: '27',
      title: 'Identify the number in the Photo.',
      options: {'300': false, '40': true, '30': false, '20': false},
      imageUrl: 'assets/Numbers/No40.jpg', 
    ),
    Question(
      id: '28',
      title: 'Identify the number in the Photo.',
      options: {'30': false, '21': false, '17': true, '16': false},
      imageUrl: 'assets/Numbers/No17.jpg', 
    ),
    Question(
      id: '29',
      title: 'Identify the number in the Photo.',
      options: {'5': false, '55': false, '25': false, '50': true},
      imageUrl: 'assets/Numbers/No50.jpg', 
    ),
    Question(
      id: '30',
      title: 'Identify the number in the Photo.',
      options: {'8': false, '9': false, '6': true, '3': false},
      imageUrl: 'assets/Numbers/No6.jpg', 
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
