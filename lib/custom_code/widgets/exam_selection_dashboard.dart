// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class ExamSelectionDashboard extends StatefulWidget {
  const ExamSelectionDashboard({
    super.key,
    this.width,
    this.height,
    this.onStage1,
    this.onStage2,
    this.onStage3,
    this.onFinal,
  });

  final double? width;
  final double? height;
  final Future Function()? onStage1;
  final Future Function()? onStage2;
  final Future Function()? onStage3;
  final Future Function()? onFinal;

  @override
  State<ExamSelectionDashboard> createState() => _ExamSelectionDashboardState();
}

class _ExamSelectionDashboardState extends State<ExamSelectionDashboard> {
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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header Section
              Icon(Icons.airplanemode_active_rounded,
                  size: 50, color: const Color(0xFF4B98FF)),
              const SizedBox(height: 15),
              Text(
                "A320 TRAINING CENTER",
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "Select your examination stage",
                style: GoogleFonts.outfit(
                  color: Colors.white54,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 50),

              // Buttons List
              _buildExamButton(
                title: "STAGE 1 EXAM",
                subtitle: "Basic Procedures & Limits",
                icon: Icons.looks_one_rounded,
                color: const Color(0xFF4B98FF),
                onTap: widget.onStage1,
              ),
              _buildExamButton(
                title: "STAGE 2 EXAM",
                subtitle: "Systems & Automation",
                icon: Icons.looks_two_rounded,
                color: const Color(0xFF4B98FF),
                onTap: widget.onStage2,
              ),
              _buildExamButton(
                title: "STAGE 3 EXAM",
                subtitle: "Abnormal & Emergency",
                icon: Icons.looks_3_rounded,
                color: const Color(0xFF4B98FF),
                onTap: widget.onStage3,
              ),
              const SizedBox(height: 10),

              // Final Exam Button (Different Style)
              _buildExamButton(
                title: "FINAL LINE CHECK",
                subtitle: "Full Certification Exam",
                icon: Icons.stars_rounded,
                color: const Color(0xFFFFD700), // Gold color for Final
                isFinal: true,
                onTap: widget.onFinal,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Future Function()? onTap,
    bool isFinal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () async {
          if (onTap != null) {
            await onTap();
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isFinal
                ? color.withOpacity(0.15)
                : Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isFinal ? color : color.withOpacity(0.3),
              width: isFinal ? 2 : 1,
            ),
            boxShadow: [
              if (isFinal)
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        color: isFinal ? color : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.outfit(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: isFinal ? color : Colors.white24,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
