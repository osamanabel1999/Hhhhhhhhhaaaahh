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

class A320QuizPart3Widget extends StatefulWidget {
  const A320QuizPart3Widget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320QuizPart3Widget> createState() => _A320QuizPart3WidgetState();
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

class _A320QuizPart3WidgetState extends State<A320QuizPart3Widget> {
  // --- STATE VARIABLES ---
  int currentIndex = 0;
  int score = 0;
  bool isCurrentQuestionAnsweredCorrectly = false;
  bool madeMistakeOnCurrent = false;
  Set<int> selectedWrongIndices = {};
  bool showResults = false;

  // --- QUIZ DATA (Questions 67 - 99) ---
  late final List<QuizQuestion> questions;

  @override
  void initState() {
    super.initState();
    questions = [
      QuizQuestion(
          question: "Q67: Maximum speed for windshield wiper operation?",
          correctAnswer: "230 kt",
          wrongOptions: ["250 kt", "200 kt", "185 kt"]),
      QuizQuestion(
          question: "Q68: Maximum speed with cockpit window open?",
          correctAnswer: "200 kt",
          wrongOptions: ["230 kt", "250 kt", "180 kt"]),
      QuizQuestion(
          question: "Q69: Autoland wind limit: Headwind?",
          correctAnswer: "30 kt",
          wrongOptions: ["20 kt", "35 kt", "40 kt"]),
      QuizQuestion(
          question: "Q70: Autoland wind limit: Tailwind?",
          correctAnswer: "10 kt",
          wrongOptions: ["15 kt", "5 kt", "12 kt"]),
      QuizQuestion(
          question: "Q71: Autoland wind limit: Crosswind?",
          correctAnswer: "20 kt",
          wrongOptions: ["15 kt", "25 kt", "30 kt"]),
      QuizQuestion(
          question:
              "Q72: Minimum height for Autopilot engagement after takeoff?",
          correctAnswer: "100 ft (or 5 sec after lift-off)",
          wrongOptions: ["500 ft", "200 ft", "1000 ft"]),
      QuizQuestion(
          question:
              "Q73: Minimum height for AP use during Straight-in Non-Precision approach?",
          correctAnswer: "250 ft AGL",
          wrongOptions: ["160 ft AGL", "500 ft AGL", "MDA"]),
      QuizQuestion(
          question: "Q74: Minimum height for AP use during Circling approach?",
          correctAnswer: "500 ft AGL",
          wrongOptions: ["400 ft AGL", "1000 ft AGL", "MDA - 100 ft"]),
      QuizQuestion(
          question:
              "Q75: Minimum height for AP use during ILS CAT 1 (no CAT 2/3 displayed)?",
          correctAnswer: "160 ft AGL",
          wrongOptions: ["100 ft AGL", "200 ft AGL", "80 ft AGL"]),
      QuizQuestion(
          question: "Q76: Minimum height for AP use in Go-Around?",
          correctAnswer: "100 ft AGL",
          wrongOptions: ["200 ft AGL", "500 ft AGL", "immediately"]),
      QuizQuestion(
          question:
              "Q77: What does the FAC (Flight Augmentation Computer) control?",
          correctAnswer: "Rudder, Yaw damping, Flight Envelope protection",
          wrongOptions: [
            "Elevators and Ailerons",
            "Auto-thrust only",
            "Navigation display only"
          ]),
      QuizQuestion(
          question: "Q78: How many ADRs (Air Data Reference) are on the A320?",
          correctAnswer: "Three",
          wrongOptions: ["Two", "Four", "One"]),
      QuizQuestion(
          question: "Q79: What is the normal time for a full IRS alignment?",
          correctAnswer: "Approx. 10 minutes",
          wrongOptions: ["5 minutes", "15 minutes", "3 minutes"]),
      QuizQuestion(
          question: "Q80: When does Probe/Window heat operate automatically?",
          correctAnswer: "After first engine start (or in flight)",
          wrongOptions: [
            "When Master Switch is ON",
            "When Pitot Heat button is pressed",
            "Only above 10,000 ft"
          ]),
      QuizQuestion(
          question: "Q81: Wing Anti-Ice uses air from which source?",
          correctAnswer: "Pneumatic system (Engine Bleed)",
          wrongOptions: [
            "Electric heaters",
            "Hydraulic heat exchange",
            "APU only"
          ]),
      QuizQuestion(
          question:
              "Q82: In 'Normal Law', what is the maximum bank angle limit?",
          correctAnswer: "67°",
          wrongOptions: ["33°", "45°", "60°"]),
      QuizQuestion(
          question:
              "Q83: In 'Normal Law', what is the pitch attitude protection limit (Clean)?",
          correctAnswer: "30° Up / 15° Down",
          wrongOptions: [
            "25° Up / 10° Down",
            "35° Up / 20° Down",
            "20° Up / 15° Down"
          ]),
      QuizQuestion(
          question:
              "Q84: What happens if both Side-sticks are moved simultaneously?",
          correctAnswer: "Algebraic sum of signals (unless priority taken)",
          wrongOptions: [
            "Left stick always has priority",
            "The plane ignores both",
            "The autopilot disconnects only"
          ]),
      QuizQuestion(
          question:
              "Q85: How many SECs (Spoiler Elevator Computers) are there?",
          correctAnswer: "Three",
          wrongOptions: ["Two", "One", "Four"]),
      QuizQuestion(
          question:
              "Q86: How many ELACs (Elevator Aileron Computers) are there?",
          correctAnswer: "Two",
          wrongOptions: ["Three", "One", "Four"]),
      QuizQuestion(
          question: "Q87: Which computer has priority for Elevator control?",
          correctAnswer: "ELAC 2",
          wrongOptions: ["ELAC 1", "SEC 1", "FAC 1"]),
      QuizQuestion(
          question:
              "Q88: If all flight control computers fail, how is the plane controlled?",
          correctAnswer: "Mechanical Backup (Trim wheel & Rudder)",
          wrongOptions: [
            "Direct Law",
            "Alternate Law",
            "It cannot be controlled"
          ]),
      QuizQuestion(
          question: "Q89: What is the purpose of the 'Ditching' button?",
          correctAnswer: "Closes all openings below water line",
          wrongOptions: [
            "Deploys life rafts",
            "Shuts down engines",
            "Drains all fuel"
          ]),
      QuizQuestion(
          question:
              "Q90: TCAS: What should the pilot do during a 'Resolution Advisory' (RA)?",
          correctAnswer: "Follow VSI green arc (Disconnect AP/FD)",
          wrongOptions: [
            "Follow Flight Director only",
            "Wait for ATC instructions",
            "Turn 90 degrees immediately"
          ]),
      QuizQuestion(
          question: "Q91: GPWS: 'Terrain, Terrain' means?",
          correctAnswer: "Conflict with terrain map data",
          wrongOptions: [
            "Excessive sink rate",
            "Unsafe gear configuration",
            "Glideslope deviation"
          ]),
      QuizQuestion(
          question: "Q92: A320 standard wingspan is approximately?",
          correctAnswer: "34.1 meters (with wingtip fences)",
          wrongOptions: ["30.5 meters", "38.2 meters", "32.0 meters"]),
      QuizQuestion(
          question: "Q93: Total number of spoilers on each wing?",
          correctAnswer: "Five",
          wrongOptions: ["Three", "Four", "Six"]),
      QuizQuestion(
          question: "Q94: Which spoilers are used for speed brakes?",
          correctAnswer: "2, 3, and 4",
          wrongOptions: ["1, 2, and 3", "All 5", "Only 3 and 4"]),
      QuizQuestion(
          question:
              "Q95: At what speed does the Ground Spoiler auto-retract after landing?",
          correctAnswer: "Not auto-retracted (manual or thrust lever move)",
          wrongOptions: [
            "Below 20 kt",
            "Below 40 kt",
            "When nose gear touches"
          ]),
      QuizQuestion(
          question:
              "Q96: EGPWS: 'Bank Angle, Bank Angle' warning triggers above?",
          correctAnswer: "7° if low, up to 40° if high altitude",
          wrongOptions: ["Always 33°", "Always 45°", "67°"]),
      QuizQuestion(
          question: "Q97: Windshear detection (reactive) is active from?",
          correctAnswer: "Lift-off to 1300 ft AGL",
          wrongOptions: [
            "Ground to 10,000 ft",
            "Only during approach",
            "50 ft to 500 ft"
          ]),
      QuizQuestion(
          question: "Q98: Predictive Windshear (PWS) scans ahead using?",
          correctAnswer: "Weather Radar",
          wrongOptions: ["Radio Altimeter", "IRS data", "ADR data"]),
      QuizQuestion(
          question: "Q99: What does 'Alpha Max' speed represent in Normal Law?",
          correctAnswer: "Maximum Angle of Attack allowed",
          wrongOptions: [
            "Maximum operating speed",
            "Speed where stall occurs",
            "Minimum flap retraction speed"
          ]),
    ];
  }

  // --- LOGIC FUNCTIONS (SAME AS PART 1 & 2) ---
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
              Text(
                "A320 TRAINING - PART 3",
                style: GoogleFonts.outfit(
                    color: const Color(0xFFFFD700),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5),
              ),
              Text(
                "${currentIndex + 1} / ${questions.length}",
                style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
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
                        fontSize: 19,
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
                                  fontSize: 15,
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
                        ? "FINISH FINAL PART"
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
        Text("TRAINING COMPLETED!",
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
              child: Text("RESTART PART 3",
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
