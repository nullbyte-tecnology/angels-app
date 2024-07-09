import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:angels_app/pages/login/login_usuario.dart';
import 'package:angels_app/pages/cadastro/cadastro_usuario.dart';
import 'package:angels_app/pages/navbar/home.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Angels App",
      home: RegisterForm(),
    );
  }
}
