import 'package:flutter/material.dart';

class GestantesPage extends StatefulWidget {
  const GestantesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GestantesPage();
  }
}

class _GestantesPage extends State<GestantesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Gestantes Page"),
      ),
    );
  }
}
