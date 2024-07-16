import 'package:angels_app/pages/gestacao/gestacao_form2.dart';
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

class GestacaoForm1 extends StatefulWidget {
  const GestacaoForm1({super.key});

  @override
  State<GestacaoForm1> createState() => _GestacaoForm1State();
}

class _GestacaoForm1State extends State<GestacaoForm1> {
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
          title: "Cadastro de Gestação",
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
                              return 'Por favor, digite o nome completo da gestante';
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
                              return 'Por favor, digite o CPF da gestante';
                            }
                            final cleanedCpf =
                                value.replaceAll(RegExp(r'\D'), '');
                            if (cleanedCpf.length != 11) {
                              return 'O CPF deve ter 11 dígitos';
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
                              return 'Por favor, digite a data de nascimento da gestante';
                            }

                            final datePattern = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                            if (!datePattern.hasMatch(value)) {
                              return 'Formato inválido. Use dd/mm/aaaa';
                            }

                            final parts = value.split('/');
                            final day = int.tryParse(parts[0]);
                            final month = int.tryParse(parts[1]);
                            final year = int.tryParse(parts[2]);

                            if (day == null ||
                                month == null ||
                                year == null ||
                                month < 1 ||
                                month > 12 ||
                                day < 1 ||
                                day > 31) {
                              return 'Data inválida';
                            }

                            if ((month == 4 ||
                                    month == 6 ||
                                    month == 9 ||
                                    month == 11) &&
                                day > 30) {
                              return 'Data inválida';
                            }

                            if (month == 2) {
                              final isLeapYear =
                                  (year % 4 == 0 && year % 100 != 0) ||
                                      (year % 400 == 0);
                              if (isLeapYear && day > 29 ||
                                  !isLeapYear && day > 28) {
                                return 'Data inválida';
                              }
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de nome
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Endereço"),
                        TextFormField(
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "Rua X, n° xx, bairo xxxx",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite o endereço da gestante';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de email
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Email"),
                        TextFormField(
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "exemplo@email.com",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite o email da gestante';
                            }
                            return null;
                          },
                        ),
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
                              return 'Por favor, digite o telefone da gestante';
                            }

                            final cleanedPhone =
                                value.replaceAll(RegExp(r'\D'), '');

                            if (cleanedPhone.length != 11) {
                              return 'O telefone deve ter 11 dígitos';
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GestacaoForm2()),
                              );
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
