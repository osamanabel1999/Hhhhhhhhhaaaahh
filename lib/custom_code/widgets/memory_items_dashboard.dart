// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class MemoryItemsDashboard extends StatefulWidget {
  const MemoryItemsDashboard({
    super.key,
    this.width,
    this.height,
    this.onEGPWS,
    this.onEmerDescent,
    this.onUnreliableSpeed,
    this.onWindshearAhead,
    this.onWindshear,
    this.onStallLiftOff,
    this.onStallRecovery,
    this.onGPWSAlerts,
    this.onLossOfBraking,
    this.onTCAS,
  });

  final double? width;
  final double? height;

  // Actions for each procedure
  final Future Function()? onEGPWS;
  final Future Function()? onEmerDescent;
  final Future Function()? onUnreliableSpeed;
  final Future Function()? onWindshearAhead;
  final Future Function()? onWindshear;
  final Future Function()? onStallLiftOff;
  final Future Function()? onStallRecovery;
  final Future Function()? onGPWSAlerts;
  final Future Function()? onLossOfBraking;
  final Future Function()? onTCAS;

  @override
  State<MemoryItemsDashboard> createState() => _MemoryItemsDashboardState();
}

class _MemoryItemsDashboardState extends State<MemoryItemsDashboard> {
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
      child: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                const Icon(Icons.warning_amber_rounded,
                    color: Color(0xFFFF4B4B), size: 40),
                const SizedBox(height: 10),
                Text(
                  "A320 MEMORY ITEMS",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  " ",
                  style: GoogleFonts.outfit(
                    color: const Color(0xFFFF4B4B).withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Scrollable List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildItem("EGPWS WARNINGS", "Terrain avoidance maneuver",
                    widget.onEGPWS),
                _buildItem("EMERGENCY DESCENT", "Rapid decompression response",
                    widget.onEmerDescent),
                _buildItem(
                    "UNRELIABLE SPEED",
                    "ADR / Pitot static troubleshooting",
                    widget.onUnreliableSpeed),
                _buildItem("WINDSHEAR AHEAD", "Predictive windshear alerts",
                    widget.onWindshearAhead),
                _buildItem("WINDSHEAR", "Reactive windshear recovery",
                    widget.onWindshear),
                _buildItem(
                    "STALL WARNING AT LIFT OFF",
                    "Immediate angle of attack recovery",
                    widget.onStallLiftOff),
                _buildItem(
                    "STALL RECOVERY",
                    "Clean or Flaps/Slat configuration",
                    widget.onStallRecovery),
                _buildItem("GPWS/EGPWS ALERTS", "Cautionary terrain alerts",
                    widget.onGPWSAlerts),
                _buildItem(
                    "LOSS OF BRAKING",
                    "Alternate braking / Anti-skid off",
                    widget.onLossOfBraking),
                _buildItem("TCAS WARNING", "Resolution Advisory response",
                    widget.onTCAS),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String subtitle, Future Function()? action) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          if (action != null) await action();
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Urgency Indicator
              Container(
                width: 4,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4B4B),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF4B4B).withOpacity(0.5),
                      blurRadius: 4,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.outfit(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
