// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320APUWidget extends StatefulWidget {
  const A320APUWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320APUWidget> createState() => _A320APUWidgetState();
}

class _A320APUWidgetState extends State<A320APUWidget> {
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
          _buildHeader("APU LIMITATIONS"),

          // --- SECTION: OIL & STARTER ---
          _buildSectionTitle("OIL & STARTER"),
          _buildLongTextRow("Oil Quantity",
              "Can be started even if LOW OIL LVL ECAM is displayed. Maintenance required within 10 hrs."),
          _buildDataRow("Starter Cycles", "3 cycles -> 60 min wait"),

          // --- SECTION: SPEED & TEMP ---
          _buildSectionTitle("ROTOR SPEED & EGT"),
          _buildDataRow("Max Rotor Speed", "107% (Auto Shutdown)"),
          _buildLongTextRow("Note", "ECAM shows 106% prior to shutdown."),
          _buildDataRow("Max EGT (Operation)", "675°C"),
          _buildDataRow("Start EGT (< 35,000ft)", "1019°C"),
          _buildDataRow("Start EGT (> 35,000ft)", "1120°C"),

          // --- SECTION: OPERATIONAL ENVELOPE ---
          _buildSectionTitle("OPERATIONAL ENVELOPE"),
          _buildDataRow("Ground Start/Ops", "Up to 15,000 ft"),
          _buildDataRow("Battery Start (EMER)", "Up to 25,000 ft"),
          _buildDataRow("Normal Start/Ops", "Up to 41,000 ft"),
          _buildDataRow("Bleed & Gen Use", "Up to 22,500 ft"),
          _buildDataRow("Generator Only", "Up to 41,000 ft"),

          // --- SECTION: PNEUMATIC & ELECTRIC ---
          _buildSectionTitle("ELECTRIC & BLEED AIR"),
          _buildDataRow("Elec Power (<= 25k ft)", "90 KVA (ISA + 35°)"),
          _buildBulletPoint("Supplies 2 packs: Up to 15,000 ft."),
          _buildBulletPoint("Supplies 1 pack: 15,000 ft to 22,500 ft."),

          const SizedBox(height: 40),
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

  Widget _buildDataRow(String label, String value) {
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
                fontSize: 14,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 14,
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
          const SizedBox(height: 4),
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, size: 18, color: Color(0xFF39D2C0)),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                color: const Color(0xFF95A1AC),
                fontSize: 13,
              ),
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
