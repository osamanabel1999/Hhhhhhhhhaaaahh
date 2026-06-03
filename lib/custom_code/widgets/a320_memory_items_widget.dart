// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320MemoryItemsWidget extends StatefulWidget {
  const A320MemoryItemsWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320MemoryItemsWidget> createState() => _A320MemoryItemsWidgetState();
}

class _A320MemoryItemsWidgetState extends State<A320MemoryItemsWidget> {
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
            color: Colors.yellowAccent.withOpacity(0.9),
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
        color: const Color(0xFF14292E),
        borderRadius: BorderRadius.circular(16),
        // تم تغيير اللون هنا للأزرق بناءً على طلبك
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
            "EGPWS WARNINGS",
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
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "“PULL UP TOGA”",
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Simultaneously:",
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          _buildDottedRow("AP", "OFF"),
          _buildDottedRow("PITCH", "PULL UP"),
          _buildDottedRow("THRUST LEVERS", "TOGA"),
          _buildDottedRow("SPEED BRAKES", "CHECK RETRACTED"),
          _buildDottedRow("BANK", "WINGS LEVEL or ADJUST"),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.circle, size: 10, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                    children: const [
                      TextSpan(text: "DO NOT CHANGE CONFIGURATION\n"),
                      TextSpan(
                        text: "(SLATS/FLAPS, GEAR) UNTIL CLEAR OF OBSTACLE",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDottedRow(String action, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 6.0, right: 12.0),
            child: Icon(Icons.circle, size: 8, color: Colors.white),
          ),
          Text(
            action,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 14,
              child: CustomPaint(
                painter: _DottedLinePainter(),
              ),
            ),
          ),
          Text(
            status,
            style: GoogleFonts.outfit(
              color: Colors.white, // النص هيفضل أبيض عشان الوضوح
              fontSize: 18,
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
    double dashWidth = 4.0;
    double dashSpace = 4.0;
    double startX = 0.0;
    final paint = Paint()
      ..color = Colors.white30
      ..strokeWidth = 1.5;

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
