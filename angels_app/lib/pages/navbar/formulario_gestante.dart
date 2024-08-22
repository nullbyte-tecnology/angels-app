import 'package:flutter/material.dart';

class FormularioGestantePage extends StatefulWidget {
  const FormularioGestantePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormularioGestantePage();
  }
}

class _FormularioGestantePage extends State<FormularioGestantePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Formulário de Cadastro de Gestante Page"),
      ),
    );
  }
}
