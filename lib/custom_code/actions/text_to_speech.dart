// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

Future textToSpeech(String textToSpeak) async {
  FlutterTts flutterTts = FlutterTts();

  // إعدادات احترافية للصوت
  await flutterTts.setLanguage("en-US"); // لغة الشرح
  await flutterTts.setSpeechRate(0.45); // سرعة هادية عشان التدريب
  await flutterTts.setPitch(1.0); // طبقة صوت طبيعية

  await flutterTts.speak(textToSpeak);
}
