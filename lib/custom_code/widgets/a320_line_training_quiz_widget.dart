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

class A320LineTrainingQuizWidget extends StatefulWidget {
  const A320LineTrainingQuizWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320LineTrainingQuizWidget> createState() =>
      _A320LineTrainingQuizWidgetState();
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

class _A320LineTrainingQuizWidgetState
    extends State<A320LineTrainingQuizWidget> {
  // --- STATE VARIABLES ---
  int currentIndex = 0;
  int score = 0;
  bool isCurrentQuestionAnsweredCorrectly = false;
  bool madeMistakeOnCurrent = false;
  Set<int> selectedWrongIndices = {};
  bool showResults = false;

  // --- QUIZ DATA (33 Questions) ---
  late final List<QuizQuestion> questions;

  @override
  void initState() {
    super.initState();
    questions = [
      QuizQuestion(
          question: "Q1: Maximum operating altitude?",
          correctAnswer: "39,000 ft",
          wrongOptions: ["41,000 ft", "37,000 ft", "39,500 ft"]),
      QuizQuestion(
          question: "Q2: Maximum takeoff and landing altitude?",
          correctAnswer: "9,200 ft",
          wrongOptions: ["8,500 ft", "10,000 ft", "9,500 ft"]),
      QuizQuestion(
          question: "Q3: Max crosswind for takeoff/landing (dry)?",
          correctAnswer: "38 kt",
          wrongOptions: ["33 kt", "40 kt", "35 kt"]),
      QuizQuestion(
          question: "Q4: Max landing gear extension altitude?",
          correctAnswer: "25,000 ft",
          wrongOptions: ["20,000 ft", "22,000 ft", "28,000 ft"]),
      QuizQuestion(
          question: "Q5: VLE – Maximum landing gear extended speed?",
          correctAnswer: "280 kt / M 0.67",
          wrongOptions: [
            "250 kt / M 0.60",
            "300 kt / M 0.70",
            "270 kt / M 0.65"
          ]),
      QuizQuestion(
          question: "Q6: VLO – Maximum gear operating speed?",
          correctAnswer: "250 kt / M 0.60",
          wrongOptions: [
            "280 kt / M 0.67",
            "220 kt / M 0.55",
            "260 kt / M 0.62"
          ]),
      QuizQuestion(
          question: "Q7: Max tire speed?",
          correctAnswer: "195 kt groundspeed",
          wrongOptions: [
            "195 kt airspeed",
            "205 kt groundspeed",
            "185 kt groundspeed"
          ]),
      QuizQuestion(
          question: "Q8: Max flap extension altitude?",
          correctAnswer: "20,000 ft",
          wrongOptions: ["25,000 ft", "18,000 ft", "22,000 ft"]),
      QuizQuestion(
          question: "Q9: Max tailwind for takeoff/landing?",
          correctAnswer: "15 kt",
          wrongOptions: ["10 kt", "20 kt", "12 kt"]),
      QuizQuestion(
          question: "Q10: When does Alpha Floor activate?",
          correctAnswer: "At high AOA before stall",
          wrongOptions: [
            "At stick shaker activation",
            "When speed drops below VLS",
            "When flap overspeed occurs"
          ]),
      QuizQuestion(
          question: "Q11: Engine type on most A320ceo?",
          correctAnswer: "CFM56-5B or IAE V2500",
          wrongOptions: [
            "LEAP-1A or PW1100G",
            "CFM56-7B or RB211",
            "Trent 700 or GE90"
          ]),
      QuizQuestion(
          question:
              "Q12: Max EGT for takeoff/go-around (5 min/10 min ENG OUT)?",
          correctAnswer: "950°C CFM56",
          wrongOptions: ["915°C CFM56", "1050°C CFM56", "890°C CFM56"]),
      QuizQuestion(
          question: "Q13: Max continuous thrust EGT limit?",
          correctAnswer: "915°C CFM56",
          wrongOptions: ["950°C CFM56", "925°C CFM56", "895°C CFM56"]),
      QuizQuestion(
          question: "Q14: APU max start altitude?",
          correctAnswer: "39,000 ft (electric only)",
          wrongOptions: [
            "41,000 ft (electric only)",
            "25,000 ft (electric only)",
            "22,500 ft (electric only)"
          ]),
      QuizQuestion(
          question: "Q15: APU bleed air max altitude?",
          correctAnswer: "22,500 ft",
          wrongOptions: ["20,000 ft", "25,000 ft", "39,000 ft"]),
      QuizQuestion(
          question: "Q16: APU start limitation attempts?",
          correctAnswer: "3 consecutive starts then 60 min cool-down",
          wrongOptions: [
            "2 consecutive starts then 30 min cool-down",
            "3 consecutive starts then 30 min cool-down",
            "4 consecutive starts then 60 min cool-down"
          ]),
      QuizQuestion(
          question: "Q17: Engine oil min starting temperature?",
          correctAnswer: "-40°C",
          wrongOptions: ["-30°C", "-20°C", "-50°C"]),
      QuizQuestion(
          question: "Q18: Min oil quantity before engine start?",
          correctAnswer: "11 qt (CFM56)",
          wrongOptions: ["13 qt (CFM56)", "9.5 qt (CFM56)", "15 qt (CFM56)"]),
      QuizQuestion(
          question: "Q19: Engine starter limit for a dry crank?",
          correctAnswer: "2 min",
          wrongOptions: ["3 min", "5 min", "1 min"]),
      QuizQuestion(
          question: "Q20: When is continuous ignition used?",
          correctAnswer:
              "Takeoff/landing in heavy rain/turbulence, volcanic ash",
          wrongOptions: [
            "Always below 10,000 ft",
            "Only during engine start and approach",
            "When flying through visible moisture above freezing"
          ]),
      QuizQuestion(
          question: "Q21: Normal AC bus voltage?",
          correctAnswer: "115V ± 5V",
          wrongOptions: ["115V ± 10V", "28V ± 2V", "220V ± 5V"]),
      QuizQuestion(
          question: "Q22: Normal AC frequency?",
          correctAnswer: "400 Hz ± 20 Hz",
          wrongOptions: ["400 Hz ± 10 Hz", "50 Hz ± 5 Hz", "380 Hz ± 20 Hz"]),
      QuizQuestion(
          question: "Q23: How many IDGs?",
          correctAnswer: "Two (one per engine)",
          wrongOptions: [
            "Three (incl. APU)",
            "Four (two per engine)",
            "One main and one standby"
          ]),
      QuizQuestion(
          question: "Q24: Normal IDG oil temperature limit?",
          correctAnswer: "Above 185°C caution",
          wrongOptions: [
            "Above 150°C caution",
            "Above 200°C caution",
            "Above 165°C caution"
          ]),
      QuizQuestion(
          question: "Q25: What does TR do?",
          correctAnswer: "Converts AC to DC",
          wrongOptions: [
            "Converts DC to AC",
            "Stabilizes AC voltage",
            "Provides emergency DC power only"
          ]),
      QuizQuestion(
          question: "Q26: Static inverter purpose?",
          correctAnswer: "Converts DC to AC for AC ESS bus",
          wrongOptions: [
            "Converts AC to DC for DC BAT bus",
            "Provides power directly to the APU",
            "Charges the main batteries"
          ]),
      QuizQuestion(
          question: "Q27: When does the RAT deploy automatically?",
          correctAnswer: "Loss of AC BUS 1 & AC BUS 2",
          wrongOptions: [
            "Dual engine failure only",
            "Loss of Green hydraulic system",
            "Loss of DC ESS BUS"
          ]),
      QuizQuestion(
          question: "Q28: RAT powers what?",
          correctAnswer: "Blue hydraulic + emergency generator",
          wrongOptions: [
            "Green hydraulic + essential AC",
            "Yellow hydraulic + standby generator",
            "Blue hydraulic only"
          ]),
      QuizQuestion(
          question: "Q29: How many batteries?",
          correctAnswer: "Two",
          wrongOptions: ["Three", "One", "Four"]),
      QuizQuestion(
          question: "Q30: Battery normal voltage?",
          correctAnswer: "25.5V or above",
          wrongOptions: ["28V or above", "24V exactly", "22.5V or above"]),
      QuizQuestion(
          question: "Q31: Normal hydraulic pressure?",
          correctAnswer: "3000 psi",
          wrongOptions: ["2500 psi", "3500 psi", "4000 psi"]),
      QuizQuestion(
          question: "Q32: Hydraulic systems on A320?",
          correctAnswer: "Green, Blue, Yellow",
          wrongOptions: [
            "Left, Center, Right",
            "Primary, Secondary, Standby",
            "A, B, Standby"
          ]),
      QuizQuestion(
          question: "Q33: Which system powers landing gear?",
          correctAnswer: "Green",
          wrongOptions: ["Yellow", "Blue", "Green and Yellow"]),
    ];
  }

  void handleOptionTap(int optionIndex, String selectedText) {
    if (isCurrentQuestionAnsweredCorrectly)
      return; // Prevent tapping after correct

    final currentQ = questions[currentIndex];
    bool isCorrect = selectedText == currentQ.correctAnswer;

    setState(() {
      if (isCorrect) {
        isCurrentQuestionAnsweredCorrectly = true;
        if (!madeMistakeOnCurrent) {
          score++; // Score only if first attempt is correct
        }
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
      // Re-shuffle options for a fresh experience
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
          colors: [
            Color(0xFF0F2027),
            Color(0xFF203A43),
            Color(0xFF2C5364),
          ],
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
        // Header
        Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "A320 TRAINING - PART 1",
                style: GoogleFonts.outfit(
                  color: const Color(0xFFFFD700),
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "${currentIndex + 1} / ${questions.length}",
                style: GoogleFonts.outfit(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Progress Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: (currentIndex + 1) / questions.length,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF4B98FF),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),

        // Question Box
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
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4B98FF).withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  q.question,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Options
              ...List.generate(q.allOptions.length, (index) {
                String optionText = q.allOptions[index];
                bool isCorrectAnswer = optionText == q.correctAnswer;
                bool isSelectedWrong = selectedWrongIndices.contains(index);

                // Determine color
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
                      border: Border.all(color: borderColor, width: 2),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            optionText,
                            style: GoogleFonts.outfit(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (isCurrentQuestionAnsweredCorrectly &&
                            isCorrectAnswer)
                          const Icon(Icons.check_circle,
                              color: Colors.greenAccent)
                        else if (isSelectedWrong)
                          const Icon(Icons.cancel, color: Colors.redAccent)
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),

        // Next Button
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
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4B98FF).withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  currentIndex == questions.length - 1
                      ? "FINISH TEST"
                      : "NEXT QUESTION",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          )
        else
          const SizedBox(height: 80), // Spacer when button is hidden
      ],
    );
  }

  Widget _buildResultsScreen() {
    double percentage = score / questions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "TEST COMPLETED",
          style: GoogleFonts.outfit(
            color: const Color(0xFFFFD700),
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 40),

        // Custom Donut Chart
        SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _DonutChartPainter(percentage: percentage),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${(percentage * 100).toInt()}%",
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "SCORE",
                    style: GoogleFonts.outfit(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),

        // Stats
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

        // Restart Button
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
                border: Border.all(color: Colors.white30),
              ),
              alignment: Alignment.center,
              child: Text(
                "RESTART TEST",
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
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
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.outfit(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.outfit(
              color: color.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for the Donut Chart
class _DonutChartPainter extends CustomPainter {
  final double percentage;

  _DonutChartPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20.0;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;

    // Background track (Red for wrong answers)
    Paint backgroundPaint = Paint()
      ..color = Colors.redAccent.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Foreground track (Green for correct answers)
    Paint foregroundPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the red circle first
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the green arc over it
    double sweepAngle = 2 * pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
