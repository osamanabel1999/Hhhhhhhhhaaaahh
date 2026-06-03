// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320OperationsWidget extends StatefulWidget {
  const A320OperationsWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<A320OperationsWidget> createState() => _A320OperationsWidgetState();
}

class _A320OperationsWidgetState extends State<A320OperationsWidget> {
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
            Color(0xFF2C5364), // درجة ملاحية هادية
            Color(0xFF0F2027), // نهاية غامقة
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildHeader("KINDS OF OPERATIONS"),
          _buildOpCard(
            "Category",
            "Certified as public transport category (passengers & freight)",
            Icons.verified_user_rounded,
          ),
          _buildOpCard(
            "Time Conditions",
            "Day & night operations",
            Icons.wb_sunny_rounded,
          ),
          _buildOpCard(
            "Flight Rules",
            "VFR & IFR",
            Icons.visibility_rounded, // تم تصحيح الحرف الصغير هنا
          ),
          _buildOpCard(
            "Environment",
            "Extended overwater flight & Flying in icing conditions",
            Icons.tsunami_rounded,
          ),
          _buildOpCard(
            "Capacity",
            "Max number of passengers: 180",
            Icons.people_alt_rounded,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 10), // تم تصحيح طريقة كتابة الـ Margin هنا
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF39D2C0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpCard(String label, String detail, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF39D2C0), size: 24),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF39D2C0),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  detail,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
