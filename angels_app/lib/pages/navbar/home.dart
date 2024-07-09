import 'package:angels_app/pages/navbar/formulario_gestante.dart';
import 'package:angels_app/pages/navbar/gestantes.dart';
import 'package:angels_app/pages/navbar/perfil.dart';
import 'package:angels_app/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    GestantesPage(),
    FormularioGestantePage(),
    PerfilPage()
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavbarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onDestinationSelected,
      ),
    );
  }
}
