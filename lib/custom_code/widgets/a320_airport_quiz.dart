// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class A320AirportQuiz extends StatefulWidget {
  const A320AirportQuiz({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320AirportQuiz> createState() => _A320AirportQuizState();
}

class _A320AirportQuizState extends State<A320AirportQuiz> {
  int currentQuestionIndex = 0;
  int firstTryCorrect = 0;
  int totalMistakes = 0;
  bool showResult = false;
  int? selectedAnswerIndex;
  bool isCurrentCorrect = false;
  bool alreadyMistookOnThisQuestion = false;

  // الأسئلة مستخرجة بدقة من صورتك
  final List<Map<String, dynamic>> questions = [
    {
      "q": "What is the maximum allowable Runway Slope?",
      "options": ["+/- 1%", "+/- 2%", "+/- 3%", "+/- 1.5%"],
      "correct": 1
    },
    {
      "q": "What is the maximum Runway Altitude?",
      "options": ["8500 ft", "9500 ft", "9200 ft", "10,000 ft"],
      "correct": 2
    },
    {
      "q": "What is the minimum Runway Width required?",
      "options": ["30m", "45m", "50m", "60m"],
      "correct": 1
    },
    {
      "q": "Max Crosswind for takeoff and landing (includes gusts)?",
      "options": ["30 KTS", "35 KTS", "38 KTS", "40 KTS"],
      "correct": 2
    },
    {
      "q": "What is the maximum Tailwind for takeoff/landing?",
      "options": ["10 KTS", "15 KTS", "5 KTS", "12 KTS"],
      "correct": 0
    },
    {
      "q": "Max wind for Passenger Door operation?",
      "options": ["40 KTS", "50 KTS", "60 KTS", "65 KTS"],
      "correct": 3
    },
    {
      "q": "Max wind for Cargo Door operation?",
      "options": ["40 KTS", "35 KTS", "50 KTS", "45 KTS"],
      "correct": 0
    },
    {
      "q": "Max wind for Cargo Door if nose faces the wind?",
      "options": ["40 KTS", "65 KTS", "50 KTS", "55 KTS"],
      "correct": 2
    },
    {
      "q": "Cargo door must be closed before reaching wind speed of:",
      "options": ["40 KTS", "50 KTS", "60 KTS", "65 KTS"],
      "correct": 3
    },
    {
      "q": "Does the maximum crosswind limitation include gusts?",
      "options": ["No", "Yes", "Only for takeoff", "Only for landing"],
      "correct": 1
    },
  ];

  void handleAnswer(int index) {
    if (isCurrentCorrect) return; // منع الضغط بعد الإجابة الصح

    setState(() {
      selectedAnswerIndex = index;
      if (index == questions[currentQuestionIndex]['correct']) {
        isCurrentCorrect = true;
        if (!alreadyMistookOnThisQuestion) {
          firstTryCorrect++;
        }
      } else {
        if (!alreadyMistookOnThisQuestion) {
          totalMistakes++;
          alreadyMistookOnThisQuestion = true;
        }
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        isCurrentCorrect = false;
        alreadyMistookOnThisQuestion = false;
      } else {
        showResult = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) return _buildResultScreen();

    var currentQ = questions[currentQuestionIndex];

    return Container(
      width: widget.width,
      height: widget.height,
      color: Color(0xFF0F1316),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // العداد
          Text(
            "Question ${currentQuestionIndex + 1} / ${questions.length}",
            style: GoogleFonts.outfit(color: Color(0xFF39D2C0), fontSize: 14),
          ),
          SizedBox(height: 20),
          // السؤال
          Text(
            currentQ['q'],
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          // الاختيارات
          ...List.generate(4, (index) {
            Color btnColor = Color(0xFF1D2428);
            if (selectedAnswerIndex == index) {
              btnColor = (index == currentQ['correct'])
                  ? Colors.green.withOpacity(0.7)
                  : Colors.red.withOpacity(0.7);
            } else if (isCurrentCorrect && index == currentQ['correct']) {
              btnColor = Colors.green.withOpacity(0.7);
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => handleAnswer(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Text(
                    currentQ['options'][index],
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          // زرار التالي (يظهر فقط عند الإجابة الصحيحة)
          if (isCurrentCorrect)
            ElevatedButton(
              onPressed: nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF39D2C0),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text("NEXT QUESTION",
                  style: GoogleFonts.outfit(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    double score = (firstTryCorrect / questions.length);
    return Container(
      color: Color(0xFF0F1316),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("EXAM COMPLETED",
              style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 15.0,
            animation: true,
            percent: score,
            center: Text("${(score * 100).toInt()}%",
                style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: score == 1.0 ? Colors.green : Color(0xFF39D2C0),
            backgroundColor: Colors.white10,
          ),
          SizedBox(height: 30),
          Text("Correct (1st Try): $firstTryCorrect",
              style: GoogleFonts.outfit(color: Colors.green, fontSize: 16)),
          Text("Total Mistakes: $totalMistakes",
              style: GoogleFonts.outfit(color: Colors.red, fontSize: 16)),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                firstTryCorrect = 0;
                totalMistakes = 0;
                showResult = false;
                selectedAnswerIndex = null;
                isCurrentCorrect = false;
              });
            },
            child: Text("RESTART EXAM"),
          )
        ],
      ),
    );
  }
}
