import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'memory_items_page_model.dart';
export 'memory_items_page_model.dart';

class MemoryItemsPageWidget extends StatefulWidget {
  const MemoryItemsPageWidget({super.key});

  static String routeName = 'MemoryItemsPage';
  static String routePath = '/memoryItemsPage';

  @override
  State<MemoryItemsPageWidget> createState() => _MemoryItemsPageWidgetState();
}

class _MemoryItemsPageWidgetState extends State<MemoryItemsPageWidget> {
  late MemoryItemsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemoryItemsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              if (FFAppState().TapNumber == 23)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.EmergencyDescentWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 24)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.UnreliableSpeedWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 25)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.WindshearAheadWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 26)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.WindShearWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 27)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.StallWarningLiftOffWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 28)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.StallRecoveryCOMWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 29)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.GpwsAlertsWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 30)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.LossOfBrakingWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 22)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.A320MemoryItemsWidget(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              if (FFAppState().TapNumber == 31)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.TcasWarningCorrectedWidget(
                      width: double.infinity,
                      height: double.infinity,
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
