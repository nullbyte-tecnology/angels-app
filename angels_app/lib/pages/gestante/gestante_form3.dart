import 'package:angels_app/pages/navbar/home.dart';
import 'package:angels_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

class PregantForm3 extends StatefulWidget {
  const PregantForm3({super.key});

  @override
  State<PregantForm3> createState() => _PregnantForm3State();
}

class _PregnantForm3State extends State<PregantForm3> {
  final _formKey = GlobalKey<FormState>();

  var numberFormatter= MaskTextInputFormatter(
    mask: '##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
                    // Gestações anteriores
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Quantidade de gestações anteriores"),
                        TextFormField(
                          style: internalInputTextStyle,
                          keyboardType: TextInputType.number,
                          inputFormatters: [numberFormatter],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe a quantidade",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de gestações anteriores';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Nascidos vivos
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Quantidade de nascidos vivos"),
                        TextFormField(
                          style: internalInputTextStyle,
                          keyboardType: TextInputType.number,
                          inputFormatters: [numberFormatter],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe a quantidade",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de nascidos vivos';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Nascidos mortos
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Quantidade de nascidos mortos"),
                        TextFormField(
                          style: internalInputTextStyle,
                          keyboardType: TextInputType.number,
                          inputFormatters: [numberFormatter],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe a quantidade",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de nascidos mortos';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Partos vaginais
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Quantidade de partos vaginais"),
                        TextFormField(
                          style: internalInputTextStyle,
                          keyboardType: TextInputType.number,
                          inputFormatters: [numberFormatter],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe a quantidade",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de partos vaginais';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Partos cesários
                    Column(
                      children: [
                        const _CustomLabel(
                            textLabel: "Quantidade de partos cesários"),
                        TextFormField(
                          style: internalInputTextStyle,
                          keyboardType: TextInputType.number,
                          inputFormatters: [numberFormatter],
                          decoration: formInputDecoration.copyWith(
                            hintText: "Informe a quantidade",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a quantidade de partos cesários';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 35.0),

                    // Botão de submeter
                    SizedBox(
                        width: 207,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
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
                            'Finalizar',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),
                  ],
                ),
              )),
        ));
  }
}
