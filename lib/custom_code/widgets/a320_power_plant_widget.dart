// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320PowerPlantWidget extends StatefulWidget {
  const A320PowerPlantWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320PowerPlantWidget> createState() => _A320PowerPlantWidgetState();
}

class _A320PowerPlantWidgetState extends State<A320PowerPlantWidget> {
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
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader("POWER PLANT LIMITATIONS"),

          // --- SECTION: THRUST & EGT TABLE ---
          _buildSectionTitle("THRUST SETTING & EGT LIMITS"),
          _buildEgtTable(),

          // --- SECTION: OIL SYSTEM ---
          _buildSectionTitle("OIL SYSTEM"),
          _buildDataRow("Min Oil Quantity", "11 qt"),
          _buildDataRow("Min Oil Pressure", "60 psi"),
          _buildLongTextRow("Temperature Limits",
              "• Max prior exceeding idle: -10°C\n• Min prior takeoff: -50°C\n• Max continuous temp: 155°C\n• Max transient (15 min): 165°C\n• Max starting temp: -40°C"),

          // --- SECTION: RPM & STARTER ---
          _buildSectionTitle("RPM & STARTER"),
          _buildDataRow("N1 / N2 Max", "100% / 100%"),
          _buildLongTextRow("Starter Cycles",
              "3 cycles: (2 min, 2 min, 1 min). Pause 15s between attempts. 30 min cooling after 3 attempts or 4 min cranking."),
          _buildBulletPoint(
              "No starter engagement above 10% N2 (Ground) / 18% N2 (Flight)."),

          // --- SECTION: REVERSE THRUST & OTHERS ---
          _buildSectionTitle("OPERATIONAL NOTES"),
          _buildBulletPoint(
              "Reverse Thrust: Not permitted In-flight or to back airplane."),
          _buildBulletPoint(
              "Max Rev: Not used below 70 KTS (Idle Rev permitted to stop)."),
          _buildDataRow("Max FLX Temp", "ISA + 55°C"),
          _buildDataRow("Crosswind Start", "Up to 35 kts"),

          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildEgtTable() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Table(
        border: TableBorder.symmetric(
            inside: const BorderSide(color: Colors.white10, width: 0.5)),
        columnWidths: const {
          0: FlexColumnWidth(2.5),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
        },
        children: [
          _buildTableHeader(),
          _buildTableRow("Takeoff & GA", "5 min (10 EO)", "635°C"),
          _buildTableRow("MCT", "Unlimited", "615°C"),
          _buildTableRow("Starting", "------", "635°C"),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
      children: [
        _tableCell("Condition", isHeader: true),
        _tableCell("Time Limit", isHeader: true),
        _tableCell("EGT Limit", isHeader: true),
      ],
    );
  }

  TableRow _buildTableRow(String c1, String c2, String c3) {
    return TableRow(
      children: [
        _tableCell(c1),
        _tableCell(c2),
        _tableCell(c3, isCritical: true),
      ],
    );
  }

  Widget _tableCell(String text,
      {bool isHeader = false, bool isCritical = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.outfit(
          color: isHeader
              ? const Color(0xFF39D2C0)
              : (isCritical ? Colors.orangeAccent : Colors.white70),
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Row(
        children: [
          Container(width: 4, height: 16, color: const Color(0xFF39D2C0)),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.outfit(
              color: const Color(0xFF39D2C0),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF95A1AC), fontSize: 13)),
          Text(value,
              style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 13,
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
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: GoogleFonts.outfit(
                  color: const Color(0xFF39D2C0),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(content,
              style: GoogleFonts.outfit(
                  color: Colors.white70, fontSize: 12, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.stop, size: 10, color: Color(0xFF39D2C0)),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text,
                  style:
                      GoogleFonts.outfit(color: Colors.white70, fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Text(
        title,
        style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5),
      ),
    );
  }
}
