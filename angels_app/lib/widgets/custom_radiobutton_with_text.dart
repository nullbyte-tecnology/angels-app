import 'package:angels_app/pages/cadastro/cadastro_usuario.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonText extends StatefulWidget {
  final String? hintText;

  const CustomRadioButtonText({super.key, this.hintText});

  @override
  State<CustomRadioButtonText> createState() => _CustomRadioButtonTextState();
}

class _CustomRadioButtonTextState extends State<CustomRadioButtonText> {
  String selectedOption = '';
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                      showTextField = value == 'Sim';
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
                      showTextField = false;
                    });
                  },
                  activeColor: const Color.fromRGBO(177, 72, 138, 1),
                ),
                const SizedBox(width: 8.0),
                const Text('Não', style: TextStyle(fontSize: 18.0)),
              ],
            ),
          ],
        ),
        if (showTextField)
          Column(
            children: [
              const SizedBox(height: 8.0),
              TextFormField(
                style: internalInputTextStyle,
                decoration: formInputDecoration.copyWith(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(177, 72, 138, 1),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preenha o campo acima';
                  }
                  return null;
                },
              ),
            ],
          ),
      ],
    );
  }
}
