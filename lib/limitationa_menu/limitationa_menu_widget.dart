import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'limitationa_menu_model.dart';
export 'limitationa_menu_model.dart';

class LimitationaMenuWidget extends StatefulWidget {
  const LimitationaMenuWidget({super.key});

  static String routeName = 'LimitationaMenu';
  static String routePath = '/limitationaMenu';

  @override
  State<LimitationaMenuWidget> createState() => _LimitationaMenuWidgetState();
}

class _LimitationaMenuWidgetState extends State<LimitationaMenuWidget> {
  late LimitationaMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitationaMenuModel());
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
            'Limitations',
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
                  child: custom_widgets.A320LimitationsMenu(
                    width: double.infinity,
                    height: double.infinity,
                    onSpeedsTap: () async {
                      FFAppState().TapNumber = 1;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onPressTap: () async {
                      FFAppState().TapNumber = 2;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onAirTap: () async {
                      FFAppState().TapNumber = 3;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onFuelTap: () async {
                      FFAppState().TapNumber = 4;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onHydTap: () async {
                      FFAppState().TapNumber = 5;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onElecTap: () async {
                      FFAppState().TapNumber = 6;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onWeightTap: () async {
                      FFAppState().TapNumber = 7;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onAutopilotTap: () async {
                      FFAppState().TapNumber = 8;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onAutolandTap: () async {
                      FFAppState().TapNumber = 9;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onControlsTap: () async {
                      FFAppState().TapNumber = 10;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onApuTap: () async {
                      FFAppState().TapNumber = 11;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onNavTap: () async {
                      FFAppState().TapNumber = 12;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onOxygenTap: () async {
                      FFAppState().TapNumber = 13;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onBrakesTap: () async {
                      FFAppState().TapNumber = 14;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onPowerTap: () async {
                      FFAppState().TapNumber = 15;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onAirportTap: () async {
                      FFAppState().TapNumber = 16;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                    onOpsTap: () async {
                      FFAppState().TapNumber = 17;
                      safeSetState(() {});

                      context.pushNamed(LimitationaPageWidget.routeName);
                    },
                  ),
                ),
              ),
              FlutterFlowAdBanner(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                showsTestAd: false,
                iOSAdUnitID: 'ca-app-pub-7880697829268273/6458552008',
                androidAdUnitID: 'ca-app-pub-7880697829268273/7061187239',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
