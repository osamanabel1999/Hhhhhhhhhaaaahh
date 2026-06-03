// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320AirportOpsWidget extends StatefulWidget {
  const A320AirportOpsWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320AirportOpsWidget> createState() => _A320AirportOpsWidgetState();
}

class _A320AirportOpsWidgetState extends State<A320AirportOpsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: const BoxDecoration(
        // التدرج اللوني "البحري" الموحد
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
          _buildHeader("AIRPORT OPERATIONS"),
          _buildSectionTitle("RUNWAY LIMITS"),
          _buildDataRow("Runway Slope", "+/- 2%"),
          _buildDataRow("Max Runway Altitude", "9200 ft"),
          _buildDataRow("Nominal Runway Width", "45 m"),
          _buildSectionTitle("WIND LIMITATIONS"),
          _buildDataRow("Max Crosswind", "38 KTS",
              isCritical: true, subValue: "(Includes gusts)"),
          _buildDataRow("Max Tailwind", "10 KTS", isCritical: true),
          _buildSectionTitle("DOOR OPERATION LIMITS"),
          _buildDataRow("Max Wind Pax Door", "65 KTS"),
          _buildDataRow("Max Wind Cargo Door", "40 KTS",
              subValue: "(50 KTS if nose to wind)"),
          _buildSectionTitle("SPECIAL NOTES"),
          _buildLongTextRow("Cargo Door Safety",
              "The cargo door has to be closed before reaching the speed of 65 KTS."),
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

  Widget _buildDataRow(String label, String value,
      {bool isCritical = false, String? subValue}) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF95A1AC),
                    fontSize: 15,
                  ),
                ),
                if (subValue != null)
                  Text(
                    subValue,
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF39D2C0).withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
              ],
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
                color: const Color(0xFF95A1AC), fontSize: 14),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: GoogleFonts.outfit(
              color: Colors.white70,
              fontSize: 14,
              fontStyle: FontStyle.italic,
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
