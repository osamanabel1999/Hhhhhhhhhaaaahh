import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'a320_instructor_menu_model.dart';
export 'a320_instructor_menu_model.dart';

class A320InstructorMenuWidget extends StatefulWidget {
  const A320InstructorMenuWidget({super.key});

  static String routeName = 'A320InstructorMenu';
  static String routePath = '/a320InstructorMenu';

  @override
  State<A320InstructorMenuWidget> createState() =>
      _A320InstructorMenuWidgetState();
}

class _A320InstructorMenuWidgetState extends State<A320InstructorMenuWidget> {
  late A320InstructorMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A320InstructorMenuModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  child: custom_widgets.A320InstructorMenu(
                    width: double.infinity,
                    height: 1.0,
                    onLimitationsTap: () async {
                      context.pushNamed(LimitationaMenuWidget.routeName);
                    },
                    onMemoryItemsTap: () async {
                      context.pushNamed(MemoryItemsMenuWidget.routeName);
                    },
                    onEcamHandlingTap: () async {
                      context.pushNamed(EcamWidget.routeName);
                    },
                    onExamsTap: () async {
                      context.pushNamed(ExmasMenuWidget.routeName);
                    },
                    onPrivacyPolicyTap: () async {
                      context.pushNamed(PrivacyWidget.routeName);
                    },
                    onTermsOfUseTap: () async {
                      context.pushNamed(TermsOFuseWidget.routeName);
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
