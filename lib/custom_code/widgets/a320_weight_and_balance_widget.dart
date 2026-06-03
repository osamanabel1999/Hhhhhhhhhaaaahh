// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320WeightAndBalanceWidget extends StatefulWidget {
  const A320WeightAndBalanceWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320WeightAndBalanceWidget> createState() =>
      _A320WeightAndBalanceWidgetState();
}

class _A320WeightAndBalanceWidgetState
    extends State<A320WeightAndBalanceWidget> {
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
          _buildHeader("WEIGHT & BALANCE LIMITS"),

          // SECTION 1: C.G. LIMITATION
          _buildSectionTitle("C.G. LIMITATION"),
          _buildDataRow("Between the MAC chord length", "4.139m"),
          _buildSubHeader("In MTOW:"),
          _buildDataRow("Forward limit", "17%"),
          _buildDataRow("AFT limit", "42%"),

          // SECTION 2: WEIGHT LIMITATION
          _buildSectionTitle("WEIGHT LIMITATION"),
          _buildDataRow("Max Taxi Weight", "73,900 kg", isCritical: true),
          _buildDataRow("MTOW", "73,500 kg", isCritical: true),
          _buildDataRow("MLGDW", "64,500 kg"),
          _buildDataRow("MZFW", "61,000 kg"),
          _buildDataRow("Minimum Weight", "37,230 kg"),

          // SECTION 3: LOAD LIMIT
          _buildSectionTitle("LOAD LIMIT"),
          _buildDataRow("Clean CONF", "+2.5G's - -1G's"),
          _buildDataRow("Other than clean CONF", "0G's - +2G's"),

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
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.outfit(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w500,
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
