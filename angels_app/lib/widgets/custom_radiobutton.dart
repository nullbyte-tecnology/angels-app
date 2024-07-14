import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustiomRadioButtonState();
}

class _CustiomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: 'Sim',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: const Color.fromRGBO(177, 72, 138, 1),
            ),
            const SizedBox(width: 8.0),
            const Text('Sim', style: TextStyle(fontSize: 18.0)),
          ],
        ),
        const SizedBox(width: 16.0),
        Row(
          children: <Widget>[
            Radio(
              value: 'Não',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: const Color.fromRGBO(177, 72, 138, 1),
            ),
            const SizedBox(width: 8.0),
            const Text('Não', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ],
    );
  }
}
