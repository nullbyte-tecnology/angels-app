import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 34,
            color: Color.fromRGBO(124, 58, 102, 1),
          ),
          onPressed: () {
            print("Clicou para voltar");
          },
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(124, 58, 102, 1),
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
