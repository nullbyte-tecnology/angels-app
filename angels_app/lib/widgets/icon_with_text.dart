import 'package:flutter/material.dart';

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
