import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'memory_items_menu_model.dart';
export 'memory_items_menu_model.dart';

class MemoryItemsMenuWidget extends StatefulWidget {
  const MemoryItemsMenuWidget({super.key});

  static String routeName = 'MemoryItemsMenu';
  static String routePath = '/memoryItemsMenu';

  @override
  State<MemoryItemsMenuWidget> createState() => _MemoryItemsMenuWidgetState();
}

class _MemoryItemsMenuWidgetState extends State<MemoryItemsMenuWidget> {
  late MemoryItemsMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemoryItemsMenuModel());
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
            'Memory Items',
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
                  child: custom_widgets.MemoryItemsDashboard(
                    width: double.infinity,
                    height: double.infinity,
                    onEGPWS: () async {
                      FFAppState().TapNumber = 22;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onEmerDescent: () async {
                      FFAppState().TapNumber = 23;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onUnreliableSpeed: () async {
                      FFAppState().TapNumber = 24;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onWindshearAhead: () async {
                      FFAppState().TapNumber = 25;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onWindshear: () async {
                      FFAppState().TapNumber = 26;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onStallLiftOff: () async {
                      FFAppState().TapNumber = 27;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onStallRecovery: () async {
                      FFAppState().TapNumber = 28;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onGPWSAlerts: () async {
                      FFAppState().TapNumber = 29;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onLossOfBraking: () async {
                      FFAppState().TapNumber = 30;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
                    },
                    onTCAS: () async {
                      FFAppState().TapNumber = 31;
                      safeSetState(() {});

                      context.pushNamed(MemoryItemsPageWidget.routeName);
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
