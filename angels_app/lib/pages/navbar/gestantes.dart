import 'package:flutter/material.dart';
import 'package:angels_app/widgets/card_gestante.dart';
import '../../widgets/barra_pesquisa.dart';

class GestantesPage extends StatefulWidget {
  const GestantesPage({Key? key}) : super(key: key);

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
            Expanded(
              child: ListView(
                children: [
                  CardGestante(
                    nome: 'Maria Elizangela da Silva',
                    idade: 35,
                    semanas: 20,
                    quantidadeAcompanhamentos: 10,
                    risco: "ESTAVEL",
                  ),
                  CardGestante(
                    nome: 'Ana Carolina Oliveira',
                    idade: 28,
                    semanas: 15,
                    quantidadeAcompanhamentos: 8,
                    risco: "MODERADO",
                  ),
                  CardGestante(
                    nome: 'Juliana Santos',
                    idade: 30,
                    semanas: 25,
                    quantidadeAcompanhamentos: 12,
                    risco: "ALTO",
                  ),
                  CardGestante(
                    nome: 'Beatriz Almeida',
                    idade: 32,
                    semanas: 18,
                    quantidadeAcompanhamentos: 6,
                    risco: "ESTAVEL",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
