import 'package:angels_app/pages/homescreen/home_screen.dart';
import 'package:angels_app/pages/navbar/gestantes.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:angels_app/pages/login/login_usuario.dart';
import 'package:angels_app/pages/cadastro/cadastro_usuario.dart';
import 'package:angels_app/pages/navbar/home.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Angels App",
      home: GestantesPage(),
    );
  }
}
