import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exmas_menu_model.dart';
export 'exmas_menu_model.dart';

class ExmasMenuWidget extends StatefulWidget {
  const ExmasMenuWidget({super.key});

  static String routeName = 'ExmasMenu';
  static String routePath = '/exmasMenu';

  @override
  State<ExmasMenuWidget> createState() => _ExmasMenuWidgetState();
}

class _ExmasMenuWidgetState extends State<ExmasMenuWidget> {
  late ExmasMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExmasMenuModel());
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
          backgroundColor: Color(0xFF0F2027),
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
            'Exams',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle: FontStyle.italic,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle: FontStyle.italic,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.ExamSelectionDashboard(
                    width: double.infinity,
                    height: double.infinity,
                    onStage1: () async {
                      FFAppState().TapNumber = 18;
                      safeSetState(() {});

                      context.pushNamed(ExmasPageWidget.routeName);
                    },
                    onStage2: () async {
                      FFAppState().TapNumber = 19;
                      safeSetState(() {});

                      context.pushNamed(ExmasPageWidget.routeName);
                    },
                    onStage3: () async {
                      FFAppState().TapNumber = 20;
                      safeSetState(() {});

                      context.pushNamed(ExmasPageWidget.routeName);
                    },
                    onFinal: () async {
                      FFAppState().TapNumber = 21;
                      safeSetState(() {});

                      context.pushNamed(ExmasPageWidget.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
