import 'package:angels_app/pages/gestante/gestante_form1.dart';
import 'package:angels_app/pages/navbar/gestantes.dart';
import 'package:angels_app/pages/navbar/home.dart';
import 'package:angels_app/widgets/custom_appbar.dart';
import 'package:angels_app/widgets/custom_radiobutton_with_text.dart';
import 'package:flutter/material.dart';

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
  final String cpf;
  final String nome;
  final String dataNascimento;
  final String telefone;

  const GestacaoForm2(
      {required this.cpf,
      required this.nome,
      required this.dataNascimento,
      required this.telefone,
      super.key});

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
                    const _CustomLabel(
                        textLabel: "A gestante possui alguma alergia?"),
                    const CustomRadioButtonText(
                      hintText: "Qual/Quais? (separe por ponto)",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const _CustomLabel(
                        textLabel: "A gestante possui alguma doença crônica?"),
                    const CustomRadioButtonText(
                      hintText: "Qual/Quais? (separe por ponto)",
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const _CustomLabel(
                        textLabel:
                            "A gestante usa algum medicamento continuamente?"),
                    const CustomRadioButtonText(
                      hintText: "Qual/Quais? (separe por ponto)",
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const _CustomLabel(
                        textLabel: "Deseja adicionar alguma prescrição?"),
                    const CustomRadioButtonText(
                      hintText: "Qual/Quais? (separe por ponto)",
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    const _CustomLabel(
                        textLabel: "Deseja adicionar alguma observação?"),
                    const CustomRadioButtonText(
                      hintText: "Qual/Quais? (separe por ponto)",
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // Botão de submeter
                    SizedBox(
                        width: 207,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final cleanedCpf =
                                  widget.cpf.replaceAll(RegExp(r'\D'), '');

                              if (cleanedCpf == "12345678990") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => PregnantForm1(
                                          cpf: widget.cpf,
                                          nome: widget.nome,
                                          dataNascimento: widget.dataNascimento,
                                          telefone: widget.telefone)),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }
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
