// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320InstructorMenu extends StatefulWidget {
  const A320InstructorMenu({
    super.key,
    this.width,
    this.height,
    this.onLimitationsTap,
    this.onMemoryItemsTap,
    this.onEcamHandlingTap,
    this.onExamsTap,
    this.onPrivacyPolicyTap, // الأكشن الجديد لـ Privacy Policy
    this.onTermsOfUseTap, // الأكشن الجديد لـ Terms of Use
  });

  final double? width;
  final double? height;
  final Future Function()? onLimitationsTap;
  final Future Function()? onMemoryItemsTap;
  final Future Function()? onEcamHandlingTap;
  final Future Function()? onExamsTap;
  final Future Function()? onPrivacyPolicyTap; // تعريف الأكشن
  final Future Function()? onTermsOfUseTap; // تعريف الأكشن

  @override
  State<A320InstructorMenu> createState() => _A320InstructorMenuState();
}

class _A320InstructorMenuState extends State<A320InstructorMenu> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO",
              style: GoogleFonts.outfit(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "A320 INSTRUCTOR",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 30),

            // زرار LIMITATIONS
            _buildInstructorButton(
              title: "LIMITATIONS",
              subtitle: "Operations & Systems Limits",
              icon: Icons.speed_rounded,
              onTap: () async {
                if (widget.onLimitationsTap != null) {
                  await widget.onLimitationsTap!();
                }
              },
            ),

            const SizedBox(height: 16),

            // زرار MEMORY ITEMS
            _buildInstructorButton(
              title: "MEMORY ITEMS",
              subtitle: "Emergency & Abnormal Procedures",
              icon: Icons.warning_amber_rounded,
              onTap: () async {
                if (widget.onMemoryItemsTap != null) {
                  await widget.onMemoryItemsTap!();
                }
              },
            ),

            const SizedBox(height: 16),

            // زرار ECAM HANDLING
            _buildInstructorButton(
              title: "ECAM HANDLING",
              subtitle: "System Displays & Failure Management",
              icon: Icons.monitor_rounded,
              onTap: () async {
                if (widget.onEcamHandlingTap != null) {
                  await widget.onEcamHandlingTap!();
                }
              },
            ),

            const SizedBox(height: 16),

            // زرار EXAMS
            _buildInstructorButton(
              title: "EXAMS",
              subtitle: "Test Your Knowledge & Training",
              icon: Icons.quiz_rounded,
              onTap: () async {
                if (widget.onExamsTap != null) {
                  await widget.onExamsTap!();
                }
              },
            ),

            const SizedBox(
                height: 35), // مسافة تفصل الزراير عن اللينكات اللي تحت

            // الجزء الجديد الخاص بـ Privacy Policy و Terms of use
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // عشان يخلي كل واحدة في طرف
              children: [
                InkWell(
                  onTap: () async {
                    if (widget.onPrivacyPolicyTap != null) {
                      await widget.onPrivacyPolicyTap!();
                    }
                  },
                  child: Text(
                    "Privacy Policy",
                    style: GoogleFonts.outfit(
                      color: Colors.white54,
                      fontSize: 13,
                      decoration:
                          TextDecoration.underline, // الخط اللي تحت الكلمة
                      decorationColor: Colors.white54,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (widget.onTermsOfUseTap != null) {
                      await widget.onTermsOfUseTap!();
                    }
                  },
                  child: Text(
                    "Terms of use",
                    style: GoogleFonts.outfit(
                      color: Colors.white54,
                      fontSize: 13,
                      decoration:
                          TextDecoration.underline, // الخط اللي تحت الكلمة
                      decorationColor: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructorButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF14292E).withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF4B98FF), width: 2.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4B98FF).withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF4B98FF), size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: Colors.white30, size: 30),
          ],
        ),
      ),
    );
  }
}
