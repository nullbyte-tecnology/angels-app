import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
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

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Nova Conta",
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
                              return 'Por favor, digite o nome completo';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Campo de senha
                    Column(
                      children: [
                        const _CustomLabel(textLabel: "Senha"),
                        TextFormField(
                          style: internalInputTextStyle,
                          decoration: formInputDecoration.copyWith(
                            hintText: "**********",
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color.fromRGBO(177, 72, 138, 1),
                              ),
                            ),
                          ),
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, digite uma senha';
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
                              return 'Por favor, digite o seu email';
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
                              return 'Por favor, digite o seu telefone';
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

                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Para continuar, você concorda com os ',
                              style: TextStyle(fontSize: 12)),
                          TextSpan(
                            text: 'Termos de uso',
                            style: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Clicou termos de uso");
                              },
                          ),
                          const TextSpan(
                              text: ' e ', style: TextStyle(fontSize: 12)),
                          TextSpan(
                            text: 'Política de Privacidade',
                            style: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Clicou política de privacidade");
                              },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
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
                            'Cadastrar',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Já tem uma conta? ',
                              style: TextStyle(fontSize: 12)),
                          TextSpan(
                            text: 'Entrar',
                            style: const TextStyle(
                              color: Color.fromRGBO(177, 72, 138, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Clicou entrar");
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
