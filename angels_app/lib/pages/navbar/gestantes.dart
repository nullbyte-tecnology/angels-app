import 'package:angels_app/widgets/card_gestante.dart';
import 'package:flutter/material.dart';

import '../../widgets/barra_pesquisa.dart';

class GestantesPage extends StatefulWidget {
  const GestantesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GestantesPage();
  }
}

class _GestantesPage extends State<GestantesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(177, 72, 138, 0.25),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person_outline,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Olá, Doutor(a)",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(177, 72, 138, 1)),
                          ),
                          Text(
                            "Elisson da Silva",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(177, 72, 138, 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.settings_outlined,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const BarraPesquisa(),
            const CardGestante(),
          ],
        ),
      ),
    );
  }
}
