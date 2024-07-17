import 'package:flutter/material.dart';

class AcompanhamentoDialog {
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
            Container(
              width: 500,
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Dados de Saúde da Gestante",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromRGBO(124, 58, 102, 1)),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Peso atual:",
                    style: TextStyle(
                        color: Color.fromRGBO(124, 58, 102, 1), fontSize: 14),
                  ),
                  Text(
                    "Idade gestacional:",
                    style: TextStyle(
                        color: Color.fromRGBO(124, 58, 102, 1), fontSize: 14),
                  ),
                  Text(
                    "Pressão arterial:",
                    style: TextStyle(
                        color: Color.fromRGBO(124, 58, 102, 1), fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 500,
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dados de Saúde do Feto",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromRGBO(124, 58, 102, 1)),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Batimentos cardíacos do feto:",
                    style: TextStyle(
                        color: Color.fromRGBO(124, 58, 102, 1), fontSize: 14),
                  ),
                  Text(
                    "Altura uterina:",
                    style: TextStyle(
                        color: Color.fromRGBO(124, 58, 102, 1), fontSize: 14),
                  ),
                ],
              ),
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
