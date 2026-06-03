import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'limitationa_page_model.dart';
export 'limitationa_page_model.dart';

class LimitationaPageWidget extends StatefulWidget {
  const LimitationaPageWidget({super.key});

  static String routeName = 'LimitationaPage';
  static String routePath = '/limitationaPage';

  @override
  State<LimitationaPageWidget> createState() => _LimitationaPageWidgetState();
}

class _LimitationaPageWidgetState extends State<LimitationaPageWidget> {
  late LimitationaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitationaPageModel());
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
          backgroundColor: Color(0xFF076585),
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
            'Limitations ',
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
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (FFAppState().TapNumber == 1)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: custom_widgets.A320SpeedsWidget(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 2)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            child: custom_widgets.A320PressurizationWidget(
                              width: double.infinity,
                              height: 1.0,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 3)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            child: custom_widgets.A320AirConditioningWidget(
                              width: double.infinity,
                              height: 1.0,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 4)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320FuelWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 5)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320HydraulicsWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 6)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320ElectricalSystemWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 7)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320WeightAndBalanceWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 8)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320AutoPilotFMGSWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 9)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320AutoLandWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 10)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320FlightControlsWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 11)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320APUWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 12)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320NavigationWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 13)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320OxygenWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 14)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320BrakesAndSteeringWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 15)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320PowerPlantWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 16)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320AirportOpsWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      if (FFAppState().TapNumber == 17)
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.A320AirportOpsWidget(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                    ],
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
