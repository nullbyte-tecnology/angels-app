import 'package:angels_app/pages/cadastro/cadastro_usuario.dart';
import 'package:angels_app/pages/navbar/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import 'package:angels_app/widgets/social_login_button.dart';
import 'package:angels_app/pages/login/bem_vindo.dart';

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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Login",
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Campo de email
                    Column(
                      children: [
                        const WelcomeSection(),
                        const SizedBox(height: 16),
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

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromRGBO(177, 72, 138, 1),
                        ),
                        child: const Text('Esqueci a Senha'),
                      ),
                    ),
                    const SizedBox(height: 12.0),

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
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),

                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(height: 16),
                    const Text('Ou Acesse com'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginButton(
                          icon: Icons.g_mobiledata,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        SocialLoginButton(
                          icon: Icons.facebook,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 8),
                        SocialLoginButton(
                          icon: Icons.fingerprint,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: 'Ainda não tem conta? ',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Cadastre-se',
                            style: const TextStyle(
                                color: Color.fromRGBO(177, 72, 138, 1),
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterForm()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
