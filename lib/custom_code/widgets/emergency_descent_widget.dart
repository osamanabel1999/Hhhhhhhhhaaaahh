// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class EmergencyDescentWidget extends StatefulWidget {
  const EmergencyDescentWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<EmergencyDescentWidget> createState() => _EmergencyDescentWidgetState();
}

class _EmergencyDescentWidgetState extends State<EmergencyDescentWidget> {
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
            "EMERGENCY DESCENT",
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "“EMERGENCY DESCENT”",
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          _buildDottedRow("CREW OXY MASKS", "USE"),
          _buildDottedRow("SIGNS", "ON"),
          _buildDottedRow("EMER DESCENT", "INITIATE"),
          _buildDottedRow("THR LEVERS (if A/THR not engaged)", "IDLE"),
          _buildDottedRow("SPD BRK", "FULL"),

          const Divider(color: Colors.white24, height: 30),

          // SLEAPAOM Section
          _buildDottedRow("SPEED", "MAX/APPROPRIATE"),
          _buildDottedRow("LANDING GEAR", "CONSIDER EXT"),
          _buildDottedRow("ENG MODE SEL", "IGN"),
          _buildDottedRow("ATC", "NOTIFY"),
          _buildDottedRow("PA “EMER DESCENT”", "ANNOUNCE"),
          _buildDottedRow("ATC XPDR", "CONSIDER 7700"),
          _buildDottedRow("OXY MASKS DILUTION", "NORM"),
          _buildDottedRow("MAX FL", "10,000 / MEA-MORA"),

          const SizedBox(height: 20),

          // Condition Footer بتصميم القالب الثابت
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "IF CAB ALT ABOVE 14,000",
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF4B98FF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                _buildDottedRow("OXYGEN PAX MASK MAN ON", "PRESS"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDottedRow(String action, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 6.0, right: 12.0),
            child: Icon(Icons.circle, size: 6, color: Colors.white70),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    action,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 1,
                    child: CustomPaint(
                      painter: _DottedLinePainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            status,
            style: GoogleFonts.outfit(
              color: const Color(0xFF4B98FF),
              fontSize: 15,
              fontWeight: FontWeight.w900,
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
    double dashWidth = 4.0, dashSpace = 4.0, startX = 0.0;
    final paint = Paint()
      ..color = Colors.white12
      ..strokeWidth = 1.0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
