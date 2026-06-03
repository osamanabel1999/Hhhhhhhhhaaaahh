// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class A320QuizPart2Widget extends StatefulWidget {
  const A320QuizPart2Widget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320QuizPart2Widget> createState() => _A320QuizPart2WidgetState();
}

class QuizQuestion {
  final String question;
  final String correctAnswer;
  final List<String> allOptions;

  QuizQuestion({
    required this.question,
    required this.correctAnswer,
    required List<String> wrongOptions,
  }) : allOptions = [...wrongOptions, correctAnswer]..shuffle();
}

class _A320QuizPart2WidgetState extends State<A320QuizPart2Widget> {
  int currentIndex = 0;
  int score = 0;
  bool isCurrentQuestionAnsweredCorrectly = false;
  bool madeMistakeOnCurrent = false;
  Set<int> selectedWrongIndices = {};
  bool showResults = false;

  late final List<QuizQuestion> questions;

  @override
  void initState() {
    super.initState();
    questions = [
      QuizQuestion(
          question: "Q34: Maximum positive differential pressure?",
          correctAnswer: "9.0 psi",
          wrongOptions: ["8.6 psi", "9.2 psi", "8.5 psi"]),
      QuizQuestion(
          question: "Q35: Maximum negative differential pressure?",
          correctAnswer: "-1.0 psi",
          wrongOptions: ["-0.5 psi", "-1.5 psi", "-2.0 psi"]),
      QuizQuestion(
          question: "Q36: Safety relief valve setting?",
          correctAnswer: "8.6 psi",
          wrongOptions: ["9.0 psi", "8.2 psi", "8.8 psi"]),
      QuizQuestion(
          question:
              "Q37: RAM Air Inlet opens only if differential pressure is less than?",
          correctAnswer: "1 psi",
          wrongOptions: ["2 psi", "0.5 psi", "1.5 psi"]),
      QuizQuestion(
          question: "Q38: Maximum pressure for LP Ground Air?",
          correctAnswer: "45 psi",
          wrongOptions: ["30 psi", "50 psi", "60 psi"]),
      QuizQuestion(
          question: "Q39: Maximum temperature/pressure for HP ground source?",
          correctAnswer: "200°C / 45 psi",
          wrongOptions: ["180°C / 40 psi", "210°C / 50 psi", "150°C / 35 psi"]),
      QuizQuestion(
          question: "Q40: When should PACK FLOW be set to HI?",
          correctAnswer: "Above 20 pax or high humidity",
          wrongOptions: [
            "Only during takeoff",
            "When temperature is above 30°C",
            "Below 140 pax"
          ]),
      QuizQuestion(
          question: "Q41: When should PACK FLOW be set to LO?",
          correctAnswer: "Below 140 pax",
          wrongOptions: [
            "Below 100 pax",
            "Only at cruise",
            "When using APU bleed"
          ]),
      QuizQuestion(
          question: "Q42: Emergency Exit Lights internal battery duration?",
          correctAnswer: "12 minutes",
          wrongOptions: ["10 minutes", "15 minutes", "20 minutes"]),
      QuizQuestion(
          question: "Q43: Cabin altitude warning (visual/audio) triggers at?",
          correctAnswer: "9,550 ft (+/- 350)",
          wrongOptions: ["10,000 ft", "11,300 ft", "14,000 ft"]),
      QuizQuestion(
          question: "Q44: Passenger Oxygen Masks deploy automatically at?",
          correctAnswer: "14,000 ft",
          wrongOptions: ["10,000 ft", "11,300 ft", "12,500 ft"]),
      QuizQuestion(
          question: "Q45: Approximate total usable fuel capacity?",
          correctAnswer: "18,728 kg",
          wrongOptions: ["19,000 kg", "15,500 kg", "21,200 kg"]),
      QuizQuestion(
          question: "Q46: Unusable fuel per wing tank?",
          correctAnswer: "30 kg",
          wrongOptions: ["50 kg", "20 kg", "10 kg"]),
      QuizQuestion(
          question:
              "Q47: Outer-to-inner tank transfer occurs when inner reaches?",
          correctAnswer: "750 kg",
          wrongOptions: ["500 kg", "1,000 kg", "250 kg"]),
      QuizQuestion(
          question: "Q48: Max wing tank fuel imbalance for takeoff?",
          correctAnswer: "500 kg",
          wrongOptions: ["1,500 kg", "800 kg", "1,000 kg"]),
      QuizQuestion(
          question: "Q49: VMO (Maximum Operating Speed)?",
          correctAnswer: "350 kt",
          wrongOptions: ["340 kt", "360 kt", "330 kt"]),
      QuizQuestion(
          question: "Q50: MMO (Maximum Operating Mach)?",
          correctAnswer: "0.82 M",
          wrongOptions: ["0.78 M", "0.80 M", "0.85 M"]),
      QuizQuestion(
          question: "Q51: Maximum speed with Flaps 1?",
          correctAnswer: "230 kt",
          wrongOptions: ["215 kt", "200 kt", "240 kt"]),
      QuizQuestion(
          question: "Q52: Maximum speed with Flaps 1+F?",
          correctAnswer: "215 kt",
          wrongOptions: ["200 kt", "230 kt", "190 kt"]),
      QuizQuestion(
          question: "Q53: Maximum speed with Flaps 2?",
          correctAnswer: "200 kt",
          wrongOptions: ["215 kt", "185 kt", "195 kt"]),
      QuizQuestion(
          question: "Q54: Maximum speed with Flaps 3?",
          correctAnswer: "185 kt",
          wrongOptions: ["200 kt", "177 kt", "190 kt"]),
      QuizQuestion(
          question: "Q55: Maximum speed with Flaps FULL?",
          correctAnswer: "177 kt",
          wrongOptions: ["185 kt", "170 kt", "165 kt"]),
      QuizQuestion(
          question: "Q56: Max brake temperature for takeoff (Brake Fans OFF)?",
          correctAnswer: "300°C",
          wrongOptions: ["150°C", "250°C", "350°C"]),
      QuizQuestion(
          question: "Q57: Maximum taxi speed with one tire deflated per gear?",
          correctAnswer: "7 kt",
          wrongOptions: ["10 kt", "5 kt", "15 kt"]),
      QuizQuestion(
          question: "Q58: Minimum pavement width for 180° turn?",
          correctAnswer: "22.9 m / 75 ft",
          wrongOptions: ["20 m / 65 ft", "25 m / 82 ft", "18 m / 60 ft"]),
      QuizQuestion(
          question: "Q59: Cockpit door locking system type?",
          correctAnswer: "Electrical / Solenoid",
          wrongOptions: ["Purely Mechanical", "Hydraulic", "Pneumatic"]),
      QuizQuestion(
          question: "Q60: Cargo smoke detection loops per cavity?",
          correctAnswer: "2 loops",
          wrongOptions: ["1 loop", "3 loops", "4 loops"]),
      QuizQuestion(
          question: "Q61: Number of fire extinguisher bottles per engine?",
          correctAnswer: "2 bottles",
          wrongOptions: ["1 bottle", "3 bottles", "4 bottles"]),
      QuizQuestion(
          question: "Q62: Number of fire extinguisher bottles for APU?",
          correctAnswer: "1 bottle",
          wrongOptions: ["2 bottles", "0 (automated only)", "3 bottles"]),
      QuizQuestion(
          question: "Q63: Crew oxygen bottle overpressure release point?",
          correctAnswer: "2,500 - 2,700 psi",
          wrongOptions: [
            "2,000 - 2,200 psi",
            "1,500 - 1,800 psi",
            "3,000 psi"
          ]),
      QuizQuestion(
          question: "Q64: Minimum engine oil pressure?",
          correctAnswer: "13 psi / 0.9 bar",
          wrongOptions: ["15 psi", "11 psi", "20 psi"]),
      QuizQuestion(
          question: "Q65: Maximum continuous engine oil temperature?",
          correctAnswer: "140°C",
          wrongOptions: ["155°C", "130°C", "120°C"]),
      QuizQuestion(
          question: "Q66: Max transient engine oil temperature (15 min)?",
          correctAnswer: "155°C",
          wrongOptions: ["140°C", "165°C", "170°C"]),
    ];
  }

  // --- نفس الدوال السابقة بالظبط ---
  void handleOptionTap(int optionIndex, String selectedText) {
    if (isCurrentQuestionAnsweredCorrectly) return;
    final currentQ = questions[currentIndex];
    bool isCorrect = selectedText == currentQ.correctAnswer;
    setState(() {
      if (isCorrect) {
        isCurrentQuestionAnsweredCorrectly = true;
        if (!madeMistakeOnCurrent) score++;
      } else {
        madeMistakeOnCurrent = true;
        selectedWrongIndices.add(optionIndex);
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
        isCurrentQuestionAnsweredCorrectly = false;
        madeMistakeOnCurrent = false;
        selectedWrongIndices.clear();
      } else {
        showResults = true;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      isCurrentQuestionAnsweredCorrectly = false;
      madeMistakeOnCurrent = false;
      selectedWrongIndices.clear();
      showResults = false;
      for (var q in questions) {
        q.allOptions.shuffle();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: showResults ? _buildResultsScreen() : _buildQuizScreen(),
    );
  }

  Widget _buildQuizScreen() {
    final q = questions[currentIndex];
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("A320 TRAINING - PART 2",
                  style: GoogleFonts.outfit(
                      color: const Color(0xFFFFD700),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5)),
              Text("${currentIndex + 1} / ${questions.length}",
                  style: GoogleFonts.outfit(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(3)),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: (currentIndex + 1) / questions.length,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF4B98FF),
                    borderRadius: BorderRadius.circular(3))),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF14292E).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF4B98FF), width: 2),
                ),
                child: Text(q.question,
                    style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.3)),
              ),
              const SizedBox(height: 30),
              ...List.generate(q.allOptions.length, (index) {
                String optionText = q.allOptions[index];
                bool isCorrectAnswer = optionText == q.correctAnswer;
                bool isSelectedWrong = selectedWrongIndices.contains(index);
                Color borderColor = Colors.white24;
                Color bgColor = Colors.white.withOpacity(0.05);
                Color textColor = Colors.white;
                if (isCurrentQuestionAnsweredCorrectly && isCorrectAnswer) {
                  borderColor = Colors.greenAccent;
                  bgColor = Colors.green.withOpacity(0.2);
                  textColor = Colors.greenAccent;
                } else if (isSelectedWrong) {
                  borderColor = Colors.redAccent;
                  bgColor = Colors.red.withOpacity(0.2);
                  textColor = Colors.redAccent;
                }
                return GestureDetector(
                  onTap: () => handleOptionTap(index, optionText),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor, width: 2)),
                    child: Row(children: [
                      Expanded(
                          child: Text(optionText,
                              style: GoogleFonts.outfit(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600))),
                      if (isCurrentQuestionAnsweredCorrectly && isCorrectAnswer)
                        const Icon(Icons.check_circle,
                            color: Colors.greenAccent)
                      else if (isSelectedWrong)
                        const Icon(Icons.cancel, color: Colors.redAccent)
                    ]),
                  ),
                );
              }),
            ],
          ),
        ),
        if (isCurrentQuestionAnsweredCorrectly)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: nextQuestion,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: const Color(0xFF4B98FF),
                    borderRadius: BorderRadius.circular(12)),
                alignment: Alignment.center,
                child: Text(
                    currentIndex == questions.length - 1
                        ? "FINISH TEST"
                        : "NEXT QUESTION",
                    style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          )
        else
          const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildResultsScreen() {
    double percentage = score / questions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("PART 2 COMPLETED",
            style: GoogleFonts.outfit(
                color: const Color(0xFFFFD700),
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 2)),
        const SizedBox(height: 40),
        SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _DonutChartPainter(percentage: percentage),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${(percentage * 100).toInt()}%",
                      style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w900)),
                  Text("SCORE",
                      style: GoogleFonts.outfit(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatCard("CORRECT", score.toString(), Colors.greenAccent),
            const SizedBox(width: 20),
            _buildStatCard("WRONG", (questions.length - score).toString(),
                Colors.redAccent),
          ],
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: InkWell(
            onTap: restartQuiz,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white30)),
              alignment: Alignment.center,
              child: Text("RESTART TEST",
                  style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5))),
      child: Column(children: [
        Text(value,
            style: GoogleFonts.outfit(
                color: color, fontSize: 24, fontWeight: FontWeight.w900)),
        Text(label,
            style: GoogleFonts.outfit(
                color: color.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final double percentage;
  _DonutChartPainter({required this.percentage});
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20.0;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;
    Paint backgroundPaint = Paint()
      ..color = Colors.redAccent.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    Paint foregroundPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, backgroundPaint);
    double sweepAngle = 2 * pi * percentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
