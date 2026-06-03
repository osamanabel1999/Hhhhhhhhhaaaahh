// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class A320LimitationsMenu extends StatefulWidget {
  const A320LimitationsMenu({
    super.key,
    this.width,
    this.height,
    this.onSpeedsTap,
    this.onPressTap,
    this.onAirTap,
    this.onFuelTap,
    this.onHydTap,
    this.onElecTap,
    this.onWeightTap,
    this.onAutopilotTap,
    this.onAutolandTap,
    this.onControlsTap,
    this.onApuTap,
    this.onNavTap,
    this.onOxygenTap,
    this.onBrakesTap,
    this.onPowerTap,
    this.onAirportTap,
    this.onOpsTap,
  });

  final double? width;
  final double? height;

  final Future Function()? onSpeedsTap;
  final Future Function()? onPressTap;
  final Future Function()? onAirTap;
  final Future Function()? onFuelTap;
  final Future Function()? onHydTap;
  final Future Function()? onElecTap;
  final Future Function()? onWeightTap;
  final Future Function()? onAutopilotTap;
  final Future Function()? onAutolandTap;
  final Future Function()? onControlsTap;
  final Future Function()? onApuTap;
  final Future Function()? onNavTap;
  final Future Function()? onOxygenTap;
  final Future Function()? onBrakesTap;
  final Future Function()? onPowerTap;
  final Future Function()? onAirportTap;
  final Future Function()? onOpsTap;

  @override
  State<A320LimitationsMenu> createState() => _A320LimitationsMenuState();
}

class _A320LimitationsMenuState extends State<A320LimitationsMenu> {
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
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
            child: Column(
              children: [
                Text(
                  "A320 LIMITATIONS",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 5),
                Container(width: 60, height: 3, color: const Color(0xFF4B98FF)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              children: [
                _buildBtn("SPEEDS", Icons.speed, widget.onSpeedsTap),
                _buildBtn("PRESSURIZATION", Icons.compress, widget.onPressTap),
                _buildBtn("AIR CONDITIONING", Icons.air, widget.onAirTap),
                _buildBtn("FUEL", Icons.local_gas_station, widget.onFuelTap),
                _buildBtn("HYDRAULIC", Icons.settings_input_component,
                    widget.onHydTap),
                _buildBtn(
                    "ELECTRICAL SYSTEM", Icons.flash_on, widget.onElecTap),
                _buildBtn("WEIGHT AND BALANCE", Icons.monitor_weight,
                    widget.onWeightTap),
                _buildBtn("AUTO PILOT & FMGS", Icons.auto_mode,
                    widget.onAutopilotTap),
                _buildBtn("AUTO LAND", Icons.flight_land, widget.onAutolandTap),
                _buildBtn(
                    "FLIGHT CONTROLS", Icons.gamepad, widget.onControlsTap),
                _buildBtn("APU", Icons.power, widget.onApuTap),
                _buildBtn("NAVIGATION", Icons.explore, widget.onNavTap),
                _buildBtn("OXYGEN", Icons.air_rounded, widget.onOxygenTap),
                _buildBtn("BRAKES & STEERING", Icons.directions_car,
                    widget.onBrakesTap),
                _buildBtn("POWER PLANT", Icons.settings_suggest,
                    widget.onPowerTap), // تم تغييرها هنا
                _buildBtn("AIRPORT OPERATIONS", Icons.local_airport,
                    widget.onAirportTap),
                _buildBtn("OPERATIONS", Icons.assignment, widget.onOpsTap),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(String title, IconData icon, Future Function()? action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () async {
          if (action != null) await action();
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF14292E).withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF4B98FF).withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF4B98FF), size: 24),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white24, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}
