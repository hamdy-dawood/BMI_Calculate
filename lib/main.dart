import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'Splash Screen/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => BMI(),
    ),
  );
}

class BMI extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Spalsh_Screen(),
    );
  }
}
