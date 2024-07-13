import 'package:flutter/material.dart';

class CardGestante extends StatelessWidget {
  final String nome;
  final int idade;
  final int semanas;
  final int quantidadeAcompanhamentos;
  final String risco;

  const CardGestante({
    required this.nome,
    required this.idade,
    required this.semanas,
    required this.quantidadeAcompanhamentos,
    required this.risco,
    Key? key,
  }) : super(key: key);

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

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nome,
                        style: const TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(124, 58, 102, 1),
                        ),
                      ),
                      Text(
                        "${idade} anos",
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      IconWithText(
                        icon: Icons.calendar_today,
                        text: semanas.toString(),
                        width: 70,
                      ),
                      const SizedBox(width: 16.0),
                      IconWithText(
                        icon: Icons.chat_bubble,
                        text: quantidadeAcompanhamentos.toString(),
                        width: 70,
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        width: 40,
                        height: 40,
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
                      const SizedBox(width: 20.0),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: riscoColor,
                        ),
                        child: Center(
                          child: Icon(
                            riscoIcon,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final double height;

  const IconWithText({
    required this.icon,
    required this.text,
    this.width = 80.0,
    this.height = 40.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            children: [
              Icon(icon, color: Color.fromRGBO(124, 58, 102, 1)),
              const SizedBox(width: 4.0),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(124, 58, 102, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}