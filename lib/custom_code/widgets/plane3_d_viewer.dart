// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Always add any additional imports you need
import 'package:model_viewer_plus/model_viewer_plus.dart'
    as mv; // استدعاء خاص لتجنب التداخل

class Plane3DViewer extends StatefulWidget {
  const Plane3DViewer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Plane3DViewer> createState() => _Plane3DViewerState();
}

class _Plane3DViewerState extends State<Plane3DViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: mv.ModelViewer(
        backgroundColor: Colors.transparent,
        src:
            'https://raw.githubusercontent.com/osamanabel1999/A319/main/Untitled.glb',
        alt: 'A319 Aircraft Model',
        ar: false,
        autoRotate: true,
        cameraControls: true,
        disableZoom: false,
      ),
    );
  }
}
