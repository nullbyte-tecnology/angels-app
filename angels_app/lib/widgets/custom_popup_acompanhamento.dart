import 'package:flutter/material.dart';

class CustomPopupAcompanhamento {
  static void show(BuildContext context, String data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Acompanhamento - $data",
          style: TextStyle(color: Color.fromRGBO(124, 58, 102, 1)),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Realizado por:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            SizedBox(height: 8.0),
            Text(
              "Tipo de Acompanhamento:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            SizedBox(height: 16.0),
            Text(
              "Dados de Saúde da Gestante",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 4.0),
            Text(
              "Peso atual:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            Text(
              "Idade gestacional:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            Text(
              "Pressão arterial:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            SizedBox(height: 20.0),
            Text(
              "Dados de Saúde do Feto",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 4.0),
            Text(
              "Batimentos cardíacos do feto:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
            Text(
              "Altura uterina:",
              style: TextStyle(
                  color: Color.fromRGBO(124, 58, 102, 1), fontSize: 15),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Fechar",
              style: TextStyle(color: Color.fromRGBO(124, 58, 102, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
