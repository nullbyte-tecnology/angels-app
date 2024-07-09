import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GestantesPage(),
    );
  }
}

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
            const SearchBar(),
            // Adicionando o ProfileCard aqui
            const ProfileCard(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar",
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromRGBO(177, 72, 138, 0.25),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
