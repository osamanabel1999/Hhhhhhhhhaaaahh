// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320AutoPilotFMGSWidget extends StatefulWidget {
  const A320AutoPilotFMGSWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320AutoPilotFMGSWidget> createState() =>
      _A320AutoPilotFMGSWidgetState();
}

class _A320AutoPilotFMGSWidgetState extends State<A320AutoPilotFMGSWidget> {
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
          _buildHeader("AUTO PILOT & FMGS"),

          // SECTION 1: AUTO PILOT FUNCTIONS
          _buildSectionTitle("AUTO PILOT FUNCTIONS"),
          _buildDataRow("T/O with SRS mode", "100 ft. AGL",
              subValue: "Limited by FMGS to be engaged only 5 sec after T/O"),

          _buildSubHeader("Minimum Heights to use:"),
          _buildDataRow("Straight-in NPA", "MDA/MDH"),
          _buildDataRow("Straight-in LNAV/VNAV approach", "DA"),
          _buildDataRow("Circling Approach", "MDA-100ft. (MDH-100ft.)"),
          _buildDataRow("ILS CAT II & CAT III", "160ft. AGL",
              subValue: "Without FMA"),
          _buildDataRow("Go-Around", "100ft. AGL"),
          _buildDataRow("All other phases", "500ft. AGL"),

          _buildLongTextRow("A/THR",
              "Approved for use with or without AP/FD in selected or managed mode."),

          // SECTION 2: FMGS
          _buildSectionTitle("FMGS"),
          _buildLongTextRow("NPA Usage (NAV, NAV FINAL)",
              "VOR, VOR/DME, NDB, NDB/DME, RNAV (includes GPS) with the use of AP/FD"),
          _buildLongTextRow("Engine Out",
              "No use of the AP in NPA's only FD in NAV, NAV V/S, NAV FPA modes."),

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
      padding: const EdgeInsets.only(top: 8, bottom: 8),
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

  Widget _buildDataRow(String label, String value, {String? subValue}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.outfit(
                      color: const Color(0xFF95A1AC), fontSize: 15),
                ),
              ),
              Text(
                value,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if (subValue != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                subValue,
                style: GoogleFonts.outfit(
                  color: Colors.white54,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
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
                color: const Color(0xFF39D2C0),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 14,
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
