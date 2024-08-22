import 'package:angels_app/pages/gestacao/acompanhamento_form.dart';
import 'package:angels_app/pages/gestacao/card_acompanhamento.dart';
import 'package:angels_app/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';

class DetalhesGestacao extends StatelessWidget {
  final String nome;
  final int idade;
  final int semanas;
  final String risco;

  DetalhesGestacao({
    required this.nome,
    required this.idade,
    required this.semanas,
    required this.risco,
  });

  @override
  Widget build(BuildContext context) {
    Color? riscoColor;
    IconData riscoIcon;

    switch (risco) {
      case 'ESTAVEL':
        riscoColor = Colors.green;
        riscoIcon = Icons.check_circle;
        break;
      case 'MODERADO':
        riscoColor = Colors.orange;
        riscoIcon = Icons.warning;
        break;
      case 'ALTO':
        riscoColor = Colors.red;
        riscoIcon = Icons.dangerous;
        break;
      default:
        riscoColor = Colors.grey;
        riscoIcon = Icons.help;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informações da Gestação',
          style: TextStyle(color: Color.fromRGBO(124, 58, 102, 1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 209, 225, 1),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          nome,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(124, 58, 102, 1),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "${idade.toString()} anos",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(124, 58, 102, 1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            '${semanas.toString()} semanas',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(8.0),
                            backgroundColor: Color.fromRGBO(124, 58, 102, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                              SizedBox(width: 8.0),
                              Text(
                                'Calendário',
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    width: 500,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Color.fromRGBO(
                            124, 58, 102, 1), // A cor desejada da borda
                        width: 2.0, // A largura desejada da borda
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Exemplo\nDescrição do caso',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconWithText(
                            icon: Icons.calendar_today,
                            text: "55",
                            width: 70,
                          ),
                          const SizedBox(width: 16.0),
                          IconWithText(
                            icon: Icons.chat,
                            text: "40",
                            width: 70,
                          ),
                          const SizedBox(width: 27.0),
                          IconWithText(
                            icon: Icons.access_alarm,
                            text: "14/07/2024",
                            width: 140,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 37,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Gestação',
                                style: TextStyle(
                                  color: Color.fromRGBO(124, 58, 102, 1),
                                  fontSize: 15,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  riscoIcon,
                                  color: riscoColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 156),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Color.fromRGBO(124, 58, 102, 1),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AcompanhamentoForm()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              color: Color.fromRGBO(124, 58, 102, 1),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "Adicionar Acompanhamento",
                              style: TextStyle(
                                  color: Color.fromRGBO(124, 58, 102, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(color: Colors.grey),
            const SizedBox(height: 16.0),
            Expanded(
                child: ListView(
              children: [
                CardAcompanhamento(data: "01/08/2024"),
                CardAcompanhamento(data: "31/07/2024"),
                CardAcompanhamento(data: "24/07/2024"),
                CardAcompanhamento(data: "17/07/2024"),
                CardAcompanhamento(data: "10/07/2024"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
