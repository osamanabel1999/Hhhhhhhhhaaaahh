// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class LossOfBrakingWidget extends StatefulWidget {
  const LossOfBrakingWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LossOfBrakingWidget> createState() => _LossOfBrakingWidgetState();
}

class _LossOfBrakingWidgetState extends State<LossOfBrakingWidget> {
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
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTopHeader(),
          const SizedBox(height: 20),
          _buildMemoryItemCard(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Column(
      children: [
        Text(
          "MEMORY ITEMS",
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w300,
            letterSpacing: 4,
          ),
        ),
        Text(
          "A320 Series Spirit",
          style: GoogleFonts.outfit(
            color: Colors.white70,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD700),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "“STANDARD CALLOUT”",
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMemoryItemCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF14292E).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF4B98FF), width: 2.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4B98FF).withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LOSS OF BRAKING",
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white24,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "“LOSS OF BRAKING”",
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text("If No Braking:",
              style: GoogleFonts.outfit(
                  color: const Color(0xFF4B98FF), fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildDottedRow("REV", "MAX", hasBullet: true),
          _buildNote(
              "If needed, the Flight Crew may keep maximum reverse thrust until full aircraft stop."),
          _buildDottedRow("BRAKE PEDALS", "RELEASE", hasBullet: true),
          _buildNote(
              "When the flight crew sets the A/SKID & NW STRG sw OFF, the control of the braking system is transferred from the BSCU to the ABCU, and the alternate braking mode is activated."),
          _buildNote(
              "Consequently the PF should release the brake pedals before the PM selects the A/SKID off. This actions avoids brutal braking application"),
          _buildDottedRow("A/SKID OFF", "ORDER", hasBullet: true),
          _buildNote(
              "The PF orders the PM to set the A/SKID & NW STRG sw to OFF"),
          _buildDottedRow("A/SKID & N/W STRG", "OFF", hasBullet: true),
          _buildDottedRow("BRAKE PEDALS", "PRESS", hasBullet: true),
          _buildDottedRow("MAX BRK PR", "1,000 PSI", hasBullet: true),
          _buildNote(
              "The ABCU automatically limits the brake pressure to 1000 PSI. Monitor the brake pressure indicator"),
          const Divider(color: Colors.white24, height: 30),
          Text("*If still no Braking:",
              style: GoogleFonts.outfit(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildDottedRow("PARKING BRAKE", "USE", hasBullet: true),
          _buildNote(
              "Use short successive parking brake applications to stop the aircraft."),
        ],
      ),
    );
  }

  Widget _buildDottedRow(String action, String status,
      {bool hasBullet = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (hasBullet)
            const Padding(
              padding: EdgeInsets.only(bottom: 6, right: 8),
              child: Icon(Icons.circle, size: 6, color: Colors.white70),
            ),
          Expanded(
            flex: 3,
            child: Text(
              action,
              style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 1,
              child: CustomPaint(painter: _DottedLinePainter()),
            ),
          ),
          Text(
            status,
            textAlign: TextAlign.end,
            style: GoogleFonts.outfit(
                color: const Color(0xFF4B98FF),
                fontSize: 14,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildNote(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("- ", style: TextStyle(color: Colors.white54)),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                  color: Colors.white54, fontSize: 11, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 3, startX = 0;
    final paint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
