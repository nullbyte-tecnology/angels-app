// ignore_for_file: deprecated_member_use

import 'package:angels_app/pages/gestante/gestante_form3.dart';
import 'package:angels_app/pages/navbar/home.dart';
import 'package:angels_app/widgets/custom_appbar.dart';
import 'package:angels_app/widgets/custom_radiobutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

var formInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 13),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13), borderSide: BorderSide.none),
  filled: true,
  fillColor: const Color.fromRGBO(236, 241, 255, 1),
);

const internalInputTextStyle = TextStyle(
    color: Color.fromRGBO(177, 72, 138, 1),
    fontSize: 20,
    fontWeight: FontWeight.w400);

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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class PregantForm2 extends StatefulWidget {
  const PregantForm2({super.key});

  @override
  State<PregantForm2> createState() => _PregnantForm2State();
}

class _PregnantForm2State extends State<PregantForm2> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Cadastro de Gestante",
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Botão diabetes
                    const Column(
                      children: [
                        _CustomLabel(textLabel: "Você tem diabetes?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Botão hipertensão
                    const Column(
                      children: [
                        _CustomLabel(textLabel: "Você tem hipertensão?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Botão chefe
                    const Column(
                      children: [
                        _CustomLabel(textLabel: "Você é chefe de família?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Campo de renda familiar
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Qual sua renda familiar?"),
                        TextFormField(
                          style: internalInputTextStyle,
                          controller: _incomeController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MoneyInputFormatter(
                              leadingSymbol: 'R\$',
                              useSymbolPadding: true,
                              thousandSeparator: ThousandSeparator.Period,
                            )
                          ],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe o valor em reais",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a sua renda familiar';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Botão eletricidade
                    const Column(
                      children: [
                        _CustomLabel(
                            textLabel: "Há eletricidade em sua residência?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Botão água tratada
                    const Column(
                      children: [
                        _CustomLabel(
                            textLabel: "Há água tratada em sua residência?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(height: 11.0),

                    // Botão esgoto
                    const Column(
                      children: [
                        _CustomLabel(
                            textLabel: "Há rede de esgoto em sua residência?"),
                        CustomRadioButton()
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),

                    // Botão de submeter
                    Column(
                      children: [
                        const Center(
                          child: Text(
                            "É sua primeira gravidez?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 130,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print("validou");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(177, 72, 138, 1),
                                  ),
                                  child: const Text(
                                    'Sim',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                )),
                            SizedBox(
                                width: 130,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PregantForm3()),
                                      );
                                      print("validou");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(177, 72, 138, 1),
                                  ),
                                  child: const Text(
                                    'Não',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
