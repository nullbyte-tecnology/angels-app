// ignore_for_file: library_private_types_in_public_api

import 'package:angels_app/pages/gestante/gestante_form1.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> itens;

  const CustomDropdown({super.key, required this.itens});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor, selecione uma opção';
      }
      return null;
    }, builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: formInputDecoration,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: const Text(
              'Selecione uma opção',
              style: internalInputTextStyle,
            ),
            value: _selectedItem,
            style: internalInputTextStyle,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
            },
            items: widget.itens.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
