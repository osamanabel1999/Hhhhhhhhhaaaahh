// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320SpeedsWidget extends StatefulWidget {
  const A320SpeedsWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320SpeedsWidget> createState() => _A320SpeedsWidgetState();
}

class _A320SpeedsWidgetState extends State<A320SpeedsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: const BoxDecoration(
        // التدرج اللوني "مية البحر" الاحترافي
        gradient: LinearGradient(
          colors: [
            Color(0xFF076585), // أزرق بحري عميق
            Color(0xFF2C5364), // درجة ملاحية هادئة
            Color(0xFF0F2027), // نهاية غامقة للوضوح
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader("AIRBUS A320 SPEED LIMITS"),
          _buildSectionTitle("GENERAL LIMITS"),
          _buildDataRow("VMO / MMO", "350 KTS / 0.82 MACH", isCritical: true),
          _buildDataRow("VA", "0.78 MACH", isCritical: false),
          _buildSectionTitle("FLAPS / SLATS (VFE)"),
          _buildDataRow("CONF 1", "230 KTS"),
          _buildDataRow("CONF 1+F", "215 KTS"),
          _buildDataRow("CONF 2", "200 KTS"),
          _buildDataRow("CONF 3", "185 KTS"),
          _buildDataRow("CONF FULL", "177 KTS"),
          _buildSectionTitle("LANDING GEAR"),
          _buildDataRow("VLE (Extended)", "280 KTS"),
          _buildDataRow("VLO Extraction", "250 KTS"),
          _buildDataRow("VLO Retraction", "220 KTS"),
          _buildDataRow("Max Alt L/G", "25,000 FT"),
          _buildDataRow("Max Tire Speed", "195 KTS", isCritical: true),
          _buildSectionTitle("OPERATIONAL"),
          _buildDataRow("Windshield Wipers", "230 KTS"),
          _buildDataRow("Cockpit Window", "200 KTS"),
          _buildSectionTitle("SPECIAL CONDITIONS"),
          _buildLongTextRow("Taxi Speed",
              "With GW > 76,000kg, turn should be made with speed no greater than 20 KTS."),
          _buildDataRow("Stall Speed", "Computes by the graphs", isInfo: true),
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
      {bool isCritical = false, bool isInfo = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05), // لمسة زجاجية خفيفة
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(
              color: const Color(0xFF95A1AC),
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: isCritical
                  ? Colors.orangeAccent
                  : (isInfo ? Colors.lightBlueAccent : Colors.white),
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
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
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
                fontSize: 13,
                fontStyle: FontStyle.italic,
                height: 1.3),
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
          fontSize: 22,
          fontWeight: FontWeight.w800,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
