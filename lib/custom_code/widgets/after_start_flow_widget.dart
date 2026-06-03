// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class AfterStartFlowWidget extends StatefulWidget {
  const AfterStartFlowWidget({
    Key? key,
    this.width,
    this.height,
    required this.flightDeckImageUrl, // الـ Argument المطلوبة للصورة
  }) : super(key: key);

  final double? width;
  final double? height;
  final String flightDeckImageUrl; // الـ Argument المطلوبة للصورة

  @override
  _AfterStartFlowWidgetState createState() => _AfterStartFlowWidgetState();
}

class _AfterStartFlowWidgetState extends State<AfterStartFlowWidget> {
  // ألوان التمييز (Matching the reference photo)
  final Color pmAccentColor = const Color(0xFF00C853); // أخضر PM
  final Color pfAccentColor = const Color(0xFFFFEB3B); // أصفر PF
  final Color darkCardColor = const Color(0xFF263238); // لون بطاقة داكن
  final Color textColor = Colors.white; // لون النص

  // نمط الخط للـ Items
  TextStyle get itemTextStyle => GoogleFonts.roboto(
        color: textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );

  // نمط الخط للأرقام
  TextStyle get numberTextStyle => GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context)
            .primaryBackground, // خلفية داكنة مناسبة
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SingleChildScrollView(
        // لضمان ظهور كل شيء على الشاشات الصغيرة
        child: Column(
          children: [
            // 1. قسم الصورة (في الأعلى كمرجع بصري)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  // أو Image.asset إذا كنت تستخدم Assets، تأكد من الـ Path
                  widget.flightDeckImageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: darkCardColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'IMAGE ERROR: Provide Valid Path',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // 2. عنوان الـ Flow
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'A320 AFTER START FLOW PATTERN',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 3. قسم الـ Comparison الجانبي (Side-by-Side)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // عمود الـ PM (اليسار)
                Expanded(
                  child: Column(
                    children: [
                      // عنوان الدور
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: pmAccentColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'PM (Pilot Monitoring)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      // قائمة الـ Items (PM)
                      ...buildFlowList([
                        '1. ENG MODE SEL',
                        '2. APU BLEED',
                        '3. ENG ANTI-ICE',
                        '4. WING ANTI-ICE',
                        '5. APU MASTER-SWITCH',
                        '6. STATUS',
                      ], pmAccentColor),
                    ],
                  ),
                ),

                // فاصل عمودي (Vertical Line)
                Container(
                  width: 2.0,
                  height: 480.0, // ارتفاع تقريبي يتكيف مع المحتوى
                  color: darkCardColor,
                ),

                // عمود الـ PF (اليمين)
                Expanded(
                  child: Column(
                    children: [
                      // عنوان الدور
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: pfAccentColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'PF (Pilot Flying)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      // قائمة الـ Items (PF)
                      ...buildFlowList([
                        '1. GROUND SPOILERS',
                        '2. RUDDER TRIM',
                        '3. FLAPS',
                        '4. PITCH TRIM',
                      ], pfAccentColor),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function لإنشاء قائمة البطاقات المرقمة
  List<Widget> buildFlowList(List<String> items, Color accentColor) {
    return items.map((itemText) {
      // فصل الرقم عن النص (مثال: '1. ENG MODE SEL' -> ['1', 'ENG MODE SEL'])
      List<String> parts = itemText.split('. ');
      String number = parts.length > 0 ? parts[0] : '';
      String text = parts.length > 1 ? parts[1] : '';

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: darkCardColor,
            borderRadius: BorderRadius.circular(12.0),
            // تظليل خفيف لتمييز البطاقة
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: Row(
            children: [
              // حاوية الرقم
              Container(
                width: 40.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: numberTextStyle.copyWith(
                      color: accentColor == pfAccentColor
                          ? Colors.black
                          : Colors.white, // تباين لون الرقم
                    ),
                  ),
                ),
              ),
              // حاوية النص
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    text,
                    style: itemTextStyle,
                  ),
                ),
              ),
              // رمز حالة (أيقونة صح أو حالة) - اختيارية لمزيد من الاحترافية
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.check_circle_outline, // أيقونة للتحقق من الحالة
                  color: accentColor.withOpacity(0.5), // تمييز خفيف
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
