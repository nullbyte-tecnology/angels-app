import 'package:angels_app/pages/gestante/gestante_form1.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String textLabel;
  final List<String> itens;

  const CustomDropdown({Key? key, required this.textLabel, required this.itens})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomLabel extends StatelessWidget {
  final String textLabel;

  const _CustomLabel({required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            textLabel,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomLabel(textLabel: widget.textLabel), // Now accessible
        DropdownButtonFormField<String>(
          value: selectedValue,
          hint: const Text('Selecione'),
          decoration: formInputDecoration,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          items: widget.itens.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
