// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320AutoLandWidget extends StatefulWidget {
  const A320AutoLandWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320AutoLandWidget> createState() => _A320AutoLandWidgetState();
}

class _A320AutoLandWidgetState extends State<A320AutoLandWidget> {
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
          _buildHeader("AUTO LAND & ROLLOUTS"),

          // SECTION: CAT II
          _buildSectionTitle("CAT II"),
          _buildDataRow("Minimum DH", "100ft"),
          _buildLongTextRow("Requirements",
              "• At least one AP is engaged and CAT 2, CAT 3 SINGLE, CAT 3 DUAL on the FMA.\n• If no Auto land disengaged AP no later than 80 ft."),

          // SECTION: CAT III - FAIL PASSIVE
          _buildSectionTitle("CAT III – FAIL PASSIVE (SINGLE)"),
          _buildDataRow("Minimum DH", "50ft"),
          _buildLongTextRow("Requirements",
              "• At least one AP is engaged and CAT 3 SINGLE, CAT 3 DUAL on the FMA\n• Must have A/THR engaged in selected or managed mode."),

          // SECTION: CAT III - FAIL OPERATIONAL
          _buildSectionTitle("CAT III – FAIL OPERATIONAL (DUAL)"),
          _buildDataRow("Alert height", "100ft", isCritical: true),
          _buildLongTextRow("A/THR Requirement",
              "Must have A/THR engaged in selected or managed mode."),

          _buildSubHeader("CAT III with DH:"),
          _buildDataRow("Minimum DH", "25ft"),
          _buildLongTextRow(
              "Status", "Both AP's are engaged and CAT 3 DUAL on the FMA."),

          _buildSubHeader("CAT III without DH:"),
          _buildDataRow("Min Runway visibility", "75m"),
          _buildLongTextRow(
              "Status", "Both AP's are engaged and CAT 3 DUAL on the FMA."),

          // SECTION: ENGINE OUT
          _buildSectionTitle("ENGINE OUT"),
          _buildLongTextRow("Configuration & Altitude",
              "CAT 2, CAT 3 SINGLE & DUAL approved only in CONF FULL and that the engine out procedures been complete before reaching 1000ft. in the approach."),

          // SECTION: MAX CONDITIONS
          _buildSectionTitle("MAX CONDITIONS (CAT II/III APP)"),
          _buildDataRow("Headwind", "30 KTS"),
          _buildDataRow("Tailwind", "10 KTS", isCritical: true),
          _buildDataRow("Crosswind", "20 KTS"),
          _buildLongTextRow("Note",
              "If tower wind are above the limitation switch to CAT I without Auto Land."),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
          color: const Color(0xFF39D2C0).withOpacity(0.8),
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
            child: Text(label,
                style: GoogleFonts.outfit(
                    color: const Color(0xFF95A1AC), fontSize: 15)),
          ),
          Text(value,
              style: GoogleFonts.outfit(
                  color: isCritical ? Colors.orangeAccent : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)),
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
          Text(label,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF95A1AC),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(content,
              style: GoogleFonts.outfit(
                  color: Colors.white70, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      alignment: Alignment.center,
      child: Text(title,
          style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: 2)),
    );
  }
}
