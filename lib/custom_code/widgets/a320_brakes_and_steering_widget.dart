// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320BrakesAndSteeringWidget extends StatefulWidget {
  const A320BrakesAndSteeringWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320BrakesAndSteeringWidget> createState() =>
      _A320BrakesAndSteeringWidgetState();
}

class _A320BrakesAndSteeringWidgetState
    extends State<A320BrakesAndSteeringWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF076585),
            Color(0xFF2C5364),
            Color(0xFF0F2027),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader("BRAKES & STEERING"),

          // --- SECTION: BRAKES ---
          _buildSectionTitle("BRAKES LIMITATIONS"),
          _buildDataRow("Max brake temp on takeoff", "300°C", isCritical: true),

          const SizedBox(height: 10),
          _buildSubHeader("Tire Deflated Conditions:"),
          _buildDataRow("One tire (in turns)", "max 7 KTS"),
          _buildDataRow("Two tires (in turns)", "max 3 KTS"),
          _buildLongTextRow("N/W Steering Note (Two Tires)",
              "N/W steering is limited max to 30° when two tires are deflated on the same gear."),

          // --- SECTION: N/W STEERING ---
          _buildSectionTitle("N/W STEERING LIMITS"),
          _buildDataRow("Hand Wheel", "limited to 75°"),
          _buildDataRow("Rudder", "6°"),
          _buildDataRow("Towing bar", "95°"),
          _buildDataRow("Towbarless towing car", "85°"),

          const SizedBox(height: 40),
          _buildLongTextRow("Operational Safety",
              "Exceeding these angles during towing or taxi can cause structural damage to the nose landing gear assembly."),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: const Color(0xFF39D2C0),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const Divider(color: Colors.white12, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildSubHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {bool isCritical = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.outfit(
                color: const Color(0xFF95A1AC),
                fontSize: 15,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: isCritical ? Colors.orangeAccent : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLongTextRow(String label, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(
              color: const Color(0xFF39D2C0).withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: GoogleFonts.outfit(
              color: Colors.white70,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      alignment: Alignment.center,
      child: Text(
        title,
        style: GoogleFonts.outfit(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
