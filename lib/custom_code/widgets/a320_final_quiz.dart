// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// تم إيقاف هذه السطور لحل مشكلة Target of URI doesn't exist
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions

import 'dart:math';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class A320FinalQuiz extends StatefulWidget {
  const A320FinalQuiz({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320FinalQuiz> createState() => _A320FinalQuizState();
}

// --- QUIZ STATES ---
enum QuizState { setup, playing, timeUp, finished }

class QuizQuestion {
  final String question;
  final String correctAnswer;
  final List<String> wrongOptions;
  List<String> currentShuffledOptions = [];

  QuizQuestion({
    required this.question,
    required this.correctAnswer,
    required this.wrongOptions,
  });

  void shuffleOptions() {
    currentShuffledOptions = [...wrongOptions, correctAnswer]..shuffle();
  }
}

class _A320FinalQuizState extends State<A320FinalQuiz> {
  // --- STATE VARIABLES ---
  QuizState _currentState = QuizState.setup;

  // Setup Variables
  bool _isTimed = true;
  int _selectedQuestionCount = 50;

  // Playing Variables
  int currentIndex = 0;
  int score = 0;
  bool isCurrentQuestionAnsweredCorrectly = false;
  bool madeMistakeOnCurrent = false;
  Set<int> selectedWrongIndices = {};

  // Timer Variables
  Timer? _timer;
  int _timeLeft = 75 * 60; // 75 minutes in seconds

  // --- QUIZ DATA ---
  late final List<QuizQuestion> allQuestions;
  List<QuizQuestion> activeQuestions = [];

  @override
  void initState() {
    super.initState();
    // 100 Questions Bank
    allQuestions = [
      // Part 1
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
      // Part 2
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
      // Part 3
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
      QuizQuestion(
          question: "Q100: Normal APU fuel consumption on ground?",
          correctAnswer: "130 kg/hr",
          wrongOptions: ["200 kg/hr", "80 kg/hr", "300 kg/hr"]),
    ];
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // --- START QUIZ LOGIC ---
  void startQuiz() {
    setState(() {
      // 1. Shuffle all questions
      allQuestions.shuffle();

      // 2. Take the requested amount
      activeQuestions = allQuestions.take(_selectedQuestionCount).toList();

      // 3. Shuffle options for each selected question
      for (var q in activeQuestions) {
        q.shuffleOptions();
      }

      // 4. Reset Variables
      currentIndex = 0;
      score = 0;
      isCurrentQuestionAnsweredCorrectly = false;
      madeMistakeOnCurrent = false;
      selectedWrongIndices.clear();
      _currentState = QuizState.playing;

      // 5. Start Timer if Timed Mode is ON
      if (_isTimed) {
        _timeLeft = 75 * 60; // 75 minutes
        _timer?.cancel();
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (_timeLeft > 0) {
            setState(() {
              _timeLeft--;
            });
          } else {
            _timer?.cancel();
            setState(() {
              _currentState = QuizState.timeUp;
            });
          }
        });
      }
    });
  }

  void handleOptionTap(int optionIndex, String selectedText) {
    if (isCurrentQuestionAnsweredCorrectly ||
        _currentState != QuizState.playing) return;

    final currentQ = activeQuestions[currentIndex];
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
      if (currentIndex < activeQuestions.length - 1) {
        currentIndex++;
        isCurrentQuestionAnsweredCorrectly = false;
        madeMistakeOnCurrent = false;
        selectedWrongIndices.clear();
      } else {
        _timer?.cancel();
        _currentState = QuizState.finished;
      }
    });
  }

  void restartToSetup() {
    _timer?.cancel();
    setState(() {
      _currentState = QuizState.setup;
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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
      child: _buildCurrentState(),
    );
  }

  Widget _buildCurrentState() {
    switch (_currentState) {
      case QuizState.setup:
        return _buildSetupScreen();
      case QuizState.playing:
        return _buildQuizScreen();
      case QuizState.timeUp:
        return _buildTimeUpScreen();
      case QuizState.finished:
        return _buildResultsScreen();
    }
  }

  // --- 1. SETUP SCREEN ---
  Widget _buildSetupScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff_rounded,
                size: 60, color: const Color(0xFF4B98FF)),
            const SizedBox(height: 20),
            Text(
              "A320 LINE TRAINING",
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 40),

            // Question Count Selector
            Text(
              "NUMBER OF QUESTIONS",
              style: GoogleFonts.outfit(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCountBtn(50),
                _buildCountBtn(70),
                _buildCountBtn(100),
              ],
            ),
            const SizedBox(height: 40),

            // Timed Mode Toggle
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF14292E).withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: const Color(0xFF4B98FF).withOpacity(0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TIMED EXAM",
                          style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("75 Minutes",
                          style: GoogleFonts.outfit(
                              color: Colors.white54, fontSize: 14)),
                    ],
                  ),
                  Switch(
                    value: _isTimed,
                    activeColor: const Color(0xFFFFD700),
                    onChanged: (val) {
                      setState(() {
                        _isTimed = val;
                      });
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Start Button
            InkWell(
              onTap: startQuiz,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFF4B98FF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF4B98FF).withOpacity(0.4),
                        blurRadius: 15)
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "START EXAM",
                  style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountBtn(int count) {
    bool isSelected = _selectedQuestionCount == count;
    return GestureDetector(
      onTap: () => setState(() => _selectedQuestionCount = count),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFD700) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: isSelected ? const Color(0xFFFFD700) : Colors.white30),
        ),
        child: Text(
          "$count",
          style: GoogleFonts.outfit(
            color: isSelected ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // --- 2. QUIZ SCREEN ---
  Widget _buildQuizScreen() {
    final q = activeQuestions[currentIndex];
    bool isUrgentTime = _isTimed && _timeLeft < 600; // Less than 10 mins

    return Column(
      children: [
        // Header (Timer & Progress)
        Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Q ${currentIndex + 1} / ${activeQuestions.length}",
                style: GoogleFonts.outfit(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              if (_isTimed)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: isUrgentTime
                        ? Colors.redAccent.withOpacity(0.2)
                        : Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color:
                            isUrgentTime ? Colors.redAccent : Colors.white24),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timer_outlined,
                          size: 18,
                          color: isUrgentTime
                              ? Colors.redAccent
                              : const Color(0xFFFFD700)),
                      const SizedBox(width: 8),
                      Text(
                        _formatTime(_timeLeft),
                        style: GoogleFonts.outfit(
                          color: isUrgentTime
                              ? Colors.redAccent
                              : const Color(0xFFFFD700),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Progress Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(2)),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: (currentIndex + 1) / activeQuestions.length,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF4B98FF),
                    borderRadius: BorderRadius.circular(2))),
          ),
        ),
        const SizedBox(height: 30),

        // Question
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF14292E).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF4B98FF), width: 2),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFF4B98FF).withOpacity(0.15),
                        blurRadius: 15,
                        spreadRadius: 1)
                  ],
                ),
                child: Text(
                  q.question,
                  style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 1.4),
                ),
              ),
              const SizedBox(height: 30),

              // Options
              ...List.generate(q.currentShuffledOptions.length, (index) {
                String optionText = q.currentShuffledOptions[index];
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
                                fontWeight: FontWeight.w600),
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
                        blurRadius: 10)
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  currentIndex == activeQuestions.length - 1
                      ? "FINISH EXAM"
                      : "NEXT QUESTION",
                  style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
            ),
          )
        else
          const SizedBox(height: 80),
      ],
    );
  }

  // --- 3. TIME UP SCREEN ---
  Widget _buildTimeUpScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer_off_outlined,
              size: 80, color: Colors.redAccent),
          const SizedBox(height: 20),
          Text(
            "TIME'S UP!",
            style: GoogleFonts.outfit(
                color: Colors.redAccent,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                letterSpacing: 3),
          ),
          const SizedBox(height: 10),
          Text(
            "You ran out of time.",
            style: GoogleFonts.outfit(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 40),
          Text(
            "SCORE ACHIEVED",
            style: GoogleFonts.outfit(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "$score / ${activeQuestions.length}",
            style: GoogleFonts.outfit(
                color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 50),
          _buildRestartBtn(),
        ],
      ),
    );
  }

  // --- 4. RESULTS SCREEN ---
  Widget _buildResultsScreen() {
    double percentage = score / activeQuestions.length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "EXAM COMPLETED",
          style: GoogleFonts.outfit(
              color: const Color(0xFFFFD700),
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 2),
        ),
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
                  Text(
                    "${(percentage * 100).toInt()}%",
                    style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "SCORE",
                    style: GoogleFonts.outfit(
                        color: Colors.white54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
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
            _buildStatCard("WRONG", (activeQuestions.length - score).toString(),
                Colors.redAccent),
          ],
        ),
        const SizedBox(height: 50),
        _buildRestartBtn(),
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
          Text(value,
              style: GoogleFonts.outfit(
                  color: color, fontSize: 24, fontWeight: FontWeight.w900)),
          Text(label,
              style: GoogleFonts.outfit(
                  color: color.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRestartBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: restartToSetup,
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
            "NEW EXAM",
            style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
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
