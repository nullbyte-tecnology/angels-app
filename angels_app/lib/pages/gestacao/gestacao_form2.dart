import 'package:angels_app/pages/gestante/gestante_form2.dart';
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

class GestacaoForm2 extends StatefulWidget {
  const GestacaoForm2({super.key});

  @override
  State<GestacaoForm2> createState() => _GestacaoForm2State();
}

class _GestacaoForm2State extends State<GestacaoForm2> {
  final _formKey = GlobalKey<FormState>();

  final String proximaPagina = './pregnant_form_2.dart';

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
                                    builder: (context) => const PregantForm2()),
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
