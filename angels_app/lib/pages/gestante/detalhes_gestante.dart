import 'package:flutter/material.dart';

class DetalhesGestante extends StatelessWidget {
  final String nome;

  DetalhesGestante({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome Exemplo',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Idade Exemplo',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    '15 semanas',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.purple),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Exemplo\nDescrição do caso',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.purple),
                    SizedBox(width: 8.0),
                    Text(
                      '55',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.chat, color: Colors.purple),
                    SizedBox(width: 8.0),
                    Text(
                      '40',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
                Text(
                  'Data Exemplo / Horário Exe',
                  style: TextStyle(color: Colors.purple),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Divider(color: Colors.grey),
            SizedBox(height: 16.0),
            Text(
              'Acompanhamento Exemplo',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Data Exemplo',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {},
                child: Text('Adicionar Acompanhamento'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
