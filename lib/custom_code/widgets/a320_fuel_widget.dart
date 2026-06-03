// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320FuelWidget extends StatefulWidget {
  const A320FuelWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320FuelWidget> createState() => _A320FuelWidgetState();
}

class _A320FuelWidgetState extends State<A320FuelWidget> {
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
          _buildHeader("FUEL LIMITATIONS"),

          // --- SECTION: FUEL IMBALANCE ---
          _buildSectionTitle("FUEL IMBALANCE"),

          _buildSubHeader("Inner Tanks:"),
          _buildInnerTankTable(),

          const SizedBox(height: 15),
          _buildSubHeader("Outer Tanks:"),
          _buildDataRow("Max Imbalance", "530 kg"),
          _buildLongTextRow("Max Imbalance (one full/one empty) if:",
              "i. Wing 1 (outer + inner) = wing 2 (outer + inner)\nii. If Inner 1 < Inner 2 so Outer 1 > Outer 2 (but not more than 3000kg)."),

          // --- SECTION: TEMPERATURES ---
          _buildSectionTitle("TEMPERATURES"),
          _buildSubHeader("Jet A1:"),
          _buildDataRow("Minimum Temp", "(-) 43°C"),
          _buildDataRow("Maximum Temp", "54°C"),
          _buildLongTextRow("TAT Note (Jet A1 only)",
              "If the TAT is -34°C you should follow the FUEL ECAM page and make sure that the TAT is higher than -36°C."),

          // --- SECTION: TAKEOFF & MIXING ---
          _buildSectionTitle("MINIMUM FUEL FOR TAKEOFF"),
          _buildDataRow("Min Fuel", "1500 kg", isCritical: true),
          _buildLongTextRow("Warning Note",
              "Wing TK LO LVL warning must not display on the ECAM for takeoff."),

          _buildSectionTitle("MIXING FUEL"),
          _buildLongTextRow("Policy",
              "When mixing different kind of fuel the higher freezing temp of the two will considered as the new freezing temp."),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ويدجت الجدول الخاص بخزانات الوقود الداخلية
  Widget _buildInnerTankTable() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Table(
        border: TableBorder.symmetric(
            inside: const BorderSide(color: Colors.white12, width: 1)),
        children: [
          // Table Header
          TableRow(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
            children: [
              _buildTableCell("Quantity", isHeader: true),
              _buildTableCell("Imbalance", isHeader: true),
            ],
          ),
          // Row 1
          TableRow(children: [
            _buildTableCell("FULL"),
            _buildTableCell("1,500 kg"),
          ]),
          // Row 2
          TableRow(children: [
            _buildTableCell("4,300 kg"),
            _buildTableCell("1,600 kg"),
          ]),
          // Row 3
          TableRow(children: [
            _buildTableCell("2,250 kg"),
            _buildTableCell("2,250 kg"),
          ]),
        ],
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.outfit(
          color: isHeader ? const Color(0xFF39D2C0) : Colors.white,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF39D2C0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2)),
          const Divider(color: Colors.white12, thickness: 1),
        ],
      ),
    );
  }

  Widget _buildSubHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Text(title,
          style: GoogleFonts.outfit(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildDataRow(String label, String value, {bool isCritical = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF95A1AC), fontSize: 14)),
          Text(value,
              style: GoogleFonts.outfit(
                  color: isCritical ? Colors.orangeAccent : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
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
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF95A1AC),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
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
