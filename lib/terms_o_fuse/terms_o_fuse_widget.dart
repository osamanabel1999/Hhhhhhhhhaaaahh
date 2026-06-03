import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'terms_o_fuse_model.dart';
export 'terms_o_fuse_model.dart';

class TermsOFuseWidget extends StatefulWidget {
  const TermsOFuseWidget({super.key});

  static String routeName = 'TermsOFuse';
  static String routePath = '/termsOFuse';

  @override
  State<TermsOFuseWidget> createState() => _TermsOFuseWidgetState();
}

class _TermsOFuseWidgetState extends State<TermsOFuseWidget> {
  late TermsOFuseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOFuseModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF1D2428),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Terms of use',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 2.0, 0.0),
                  child: Text(
                    '\nTerms of Use for A320 Instructor\n\nEffective Date: June 2, 2026\n\n1. Acceptance of Terms\n\nBy downloading, installing, or using the \"A320 Instructor\" application (the \"App\"), you agree to be bound by these Terms of Use. If you do not agree to all the terms and conditions outlined in this document, you must not use the App and should uninstall it immediately.\n\n2. Intended Use and Scope\n\n\"A320 Instructor\" is a digital training aid designed strictly for educational purposes and flight simulation enthusiasts (e.g., users of desktop flight simulators).\n\n The App provides reference material, checklists, memory items, and ECAM training procedures based on publicly available knowledge.\n\n You agree to use the App solely for personal, non-commercial, and educational simulation purposes.\n\n3. Strict Aviation Disclaimer (Not for Real-World Use)\n\nThis is the most critical condition of using the App:\n\n NO REAL-WORLD OPERATIONS: The information, procedures, and data provided within this App must NEVER be used for real-world aircraft operations, flight planning, or real-life emergency handling.\n\n NOT CERTIFIED: This App is completely independent. It is NOT affiliated with, endorsed by, or certified by Airbus S.A.S., any airline, or any national or international aviation regulatory authority (such as the FAA, EASA, ICAO, etc.).\n\n USE OFFICIAL MANUALS: Real-world pilots must always refer to the official, approved, and up-to-date documentation provided by their airline and the aircraft manufacturer (e.g., FCOM, QRH, FCTM) for all flight operations.\n\n4. No Warranties (As-Is Provision)\n\nThe App is provided on an \"AS-IS\" and \"AS-AVAILABLE\" basis.\n\n We make no warranties, expressed or implied, regarding the accuracy, completeness, reliability, or timeliness of the information contained within the App.\n\n The App may contain typographical errors, technical inaccuracies, or outdated procedures.\n\n We do not guarantee that the App will be uninterrupted, error-free, or free of viruses or other harmful components.\n\n5. Limitation of Liability\n\nTo the maximum extent permitted by applicable law, the developer of \"A320 Instructor\" shall not be held liable for any direct, indirect, incidental, special, consequential, or punitive damages arising out of or relating to your use of, or inability to use, the App. This includes, but is not limited to, damages for personal injury, property damage, loss of profits, or data loss, even if the developer has been advised of the possibility of such damages. You assume total responsibility and risk for your use of the App.\n\n6. Intellectual Property Rights\n\n All original content, features, and functionality of the App (excluding third-party simulation content or public domain aviation data) are owned by the developer and are protected by international copyright and intellectual property laws.\n\n \"Airbus\" and \"A320\" are registered trademarks of Airbus S.A.S. The use of these terms within the App is purely descriptive and for identification purposes in an educational context, constituting \"fair use.\" We claim no ownership over Airbus trademarks or proprietary materials.\n\n7. Advertisements and Third-Party Links\n\nThe App is provided free of charge and is supported by advertisements.\n\n We are not responsible for the content, accuracy, or products offered in any third-party advertisements displayed within the App.\n\n Clicking on any ad is done at your own risk, and any interactions with third-party advertisers are solely between you and the advertiser.\n\n8. Modifications to the Terms\n\nWe reserve the right to modify or replace these Terms of Use at any time. Any changes will be effective immediately upon posting the updated Terms within the App or on our designated platforms. Your continued use of the App following the posting of any changes constitutes your acceptance of those changes.\n\n9. Contact Information\n\nIf you have any questions or concerns regarding these Terms of Use, please contact the developer at: semsimulator1@gmail.com \n\n\n',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
