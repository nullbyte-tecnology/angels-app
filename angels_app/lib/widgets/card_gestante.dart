import 'package:flutter/material.dart';

class CardGestante extends StatelessWidget {
  const CardGestante({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Maria Elizangela',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(124, 58, 102, 1),
                      ),
                    ),
                    Text(
                      '35 Anos',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  IconWithText(icon: Icons.calendar_today, text: '8'),
                  const SizedBox(width: 16.0),
                  IconWithText(icon: Icons.chat_bubble, text: '60'),
                  const SizedBox(width: 95.0),
                  Icon(Icons.favorite, color: Color.fromRGBO(124, 58, 102, 1)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Color.fromRGBO(124, 58, 102, 1)),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: Color.fromRGBO(124, 58, 102, 1),
          ),
        ),
      ],
    );
  }
}
