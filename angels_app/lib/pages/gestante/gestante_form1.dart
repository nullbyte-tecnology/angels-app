import 'package:angels_app/widgets/custom_appbar.dart';
import 'package:angels_app/widgets/custom_dropdown.dart';
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

class PregantForm1 extends StatefulWidget {
  const PregantForm1({super.key});

  @override
  State<PregantForm1> createState() => _PregnantForm1State();
}

class _PregnantForm1State extends State<PregantForm1> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final String proximaPagina = './pregnant_form_2.dart';

  var dateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var cpfMaskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
                    // Campo de nome
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Nome Completo"),
                        TextFormField(
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "Nome Sobrenome",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite o seu nome completo';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de CPF
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "CPF"),
                        TextFormField(
                          controller: _cpfController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [cpfMaskFormatter],
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "xxx.xxx.xxx-xx",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite o seu CPF';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de data de nascimento
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Data de Nascimento"),
                        TextFormField(
                          controller: _dateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [dateMaskFormatter],
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "dd/mm/aa",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite a sua data de nascimento';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de estado civil
                    const Column(
                      children: [
                        _CustomLabel(textLabel: "Estado Civil"),
                        CustomDropdown(
                          itens: ['Solteira', 'Casada', 'Divorciada', 'Viúva'],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de estado civil
                    const Column(
                      children: [
                        _CustomLabel(textLabel: "Escolaridade"),
                        CustomDropdown(
                          itens: [
                            'Fundamental Incompleto',
                            'Fundamental Completo',
                            'Médio Incompleto',
                            'Médio Completo',
                            'Superior Incompleto',
                            'Superior Completo'
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de telefone
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Telefone"),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [phoneMaskFormatter],
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "(xx) xxxxx-xxxx",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite o seu telefone';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Botão de submeter
                    SizedBox(
                        width: 207,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print("validou");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(177, 72, 138, 1),
                          ),
                          child: const Text(
                            'Continuar',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),
                  ],
                ),
              )),
        ));
  }
}
