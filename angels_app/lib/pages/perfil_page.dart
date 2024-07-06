import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PerfilPage();
  }
}

class _PerfilPage extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Perfil Page"),
      ),
    );
  }
}
