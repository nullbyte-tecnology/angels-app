import 'package:flutter/material.dart';

class BarraPesquisa extends StatelessWidget {
  const BarraPesquisa({super.key});

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
