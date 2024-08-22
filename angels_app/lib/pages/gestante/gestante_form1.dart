import 'package:angels_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'gestante_form2.dart';

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
  fontWeight: FontWeight.w400,
);

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

class PregnantForm1 extends StatefulWidget {
  final String? cpf;
  final String? nome;
  final String? dataNascimento;
  final String? telefone;

  const PregnantForm1({
    this.cpf,
    this.nome,
    this.dataNascimento,
    this.telefone,
    Key? key,
  }) : super(key: key);

  @override
  State<PregnantForm1> createState() => _PregnantForm1State();
}

class _PregnantForm1State extends State<PregnantForm1> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  late MaskTextInputFormatter cpfMaskFormatter;
  late MaskTextInputFormatter dateMaskFormatter;
  late MaskTextInputFormatter phoneMaskFormatter;

  @override
  void initState() {
    super.initState();

    cpfMaskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    dateMaskFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    _nameController.text = widget.nome ?? '';
    _cpfController.text = widget.cpf ?? '';
    _dateController.text = widget.dataNascimento ?? '';
    _phoneController.text = widget.telefone ?? '';
  }

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
                      controller: _nameController,
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
                        final cleanedCpf = value.replaceAll(RegExp(r'\D'), '');
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
                          return 'Por favor, digite a sua data de nascimento';
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

                // Campo de estado civil
                const Column(
                  children: [
                    // CustomDropdown
                  ],
                ),
                const SizedBox(height: 12.0),

                // Campo de estado civil
                const Column(
                  children: [
                    // CustomDropdown
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
                            builder: (context) => const PregantForm2(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(177, 72, 138, 1),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
