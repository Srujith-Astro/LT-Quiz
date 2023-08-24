import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<String> options;

  Question(this.question, this.options);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> personalCharacteristicsQuiz = [
    
    Question(
      "When I am in trouble, I can talk with my friends causally",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "When I am in a meeting, I can collect others' ideas and make one conclusion",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "Seeing far ahead, I can make my plan",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I would like to help anybody who is in trouble",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can invent more valuable products using gathered information",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I like myself",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "If there is an unpleasant matter, I don't worry about it for a long time",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can behave myself toward my superiors",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I have friends who kindly give me advice",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "When I act as a group, I can be a captain to lead everybody else",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "When I have an assignment, I get motivated, such as making my own deadline",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can feel happy if others are happy",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can get very useful information among many others",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I am satisfied with my everyday life",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "When I am in trouble, I can be optimistic, thinking like 'let it be'",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can talk to a senior person with a term of respect",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can disclose my real intention with my friends about everything",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "Taking an action by myself, I can motivate other people",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can finish my work quickly",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I feel very sorry when I see a person crying sorrowfully",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can get my ideas in shape using various information",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I feel confident in whatever I say",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "When I fail at something, I easily think I am no good",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
    Question(
      "I can behave politely to a stranger using formal language",
      ['Disagree', 'Somewhat Disagree', 'Somewhat Agree', 'Agree'],
    ),
 

  ];

  Map<String, int> selectedOptionsCount = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Characteristics Quiz'),
      ),
      body: ListView.builder(
        itemCount: personalCharacteristicsQuiz.length,
        itemBuilder: (BuildContext context, int index) {
          return QuestionWidget(
            question: personalCharacteristicsQuiz[index].question,
            options: personalCharacteristicsQuiz[index].options,
            onOptionSelected: (option) {
              setState(() {
                if (selectedOptionsCount.containsKey(option)) {
                  selectedOptionsCount[option];
                } else {
                  selectedOptionsCount[option] = 1;
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show the selected options count
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Options Count'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: selectedOptionsCount.entries.map((entry) {
                    return Text('${entry.key}: ${entry.value}');
                  }).toList(),
                ),
                actions: <Widget>[
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
        },
        label: Text('Submit'),
        icon: Icon(Icons.check),
      ),
    );
  }
}
class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  QuestionWidget({
    required this.question,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              question,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.map((option) {
              return RadioListTile(
                title: Text(option),
                value: option,
                groupValue: null, // You should specify the selected value here
                onChanged: (value) {
                  onOptionSelected(value!);
                },
              );
            }).toList(),
          ),
          Divider(),
        ],
      ),
    );
  }
}
