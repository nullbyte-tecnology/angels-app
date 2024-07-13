import 'package:flutter/material.dart';

class DetalhesGestante extends StatelessWidget {
  final String nome;

  DetalhesGestante({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Gestante'),
      ),
      body: Center(
        child: Text(
          'Informações sobre ${nome}',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
