import 'package:flutter/material.dart';
import 'components/button/button.dart';
import 'components/button/button_view_model.dart';
import 'components/input_field/input_field.dart';
import 'components/input_field/input_field_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastrar Tela',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Cor principal
      ),
      home: const CadastrarTela(),
    );
  }
}

class CadastrarTela extends StatefulWidget {
  const CadastrarTela({super.key});

  @override
  State<CadastrarTela> createState() => _CadastrarTelaState();
}

class _CadastrarTelaState extends State<CadastrarTela> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  bool _aceitoTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // Cor de fundo da tela
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Cadastrar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey, // Cor de fundo do avatar
                ),
                const SizedBox(height: 20),
                InputField(
                  viewModel: InputFieldViewModel(
                    controller: _emailController,
                    hintText: 'Email ou telefone',
                    fillColor: Colors.grey[200]!, // Cor de fundo do input
                  ),
                ),
                const SizedBox(height: 10),
                InputField(
                  viewModel: InputFieldViewModel(
                    controller: _senhaController,
                    hintText: 'Senha',
                    obscureText: true,
                    fillColor: Colors.grey[200]!, // Cor de fundo do input
                  ),
                ),
                const SizedBox(height: 10),
                InputField(
                  viewModel: InputFieldViewModel(
                    controller: _confirmarSenhaController,
                    hintText: 'Confirmar senha',
                    obscureText: true,
                    fillColor: Colors.grey[200]!,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: _aceitoTermos,
                      onChanged: (value) {
                        setState(() {
                          _aceitoTermos = value!;
                        });
                      },
                    ),
                    const Text('Aceito os '),
                    InkWell(
                      onTap: () {
                        // Ação ao clicar em "Termos de Uso"
                      },
                      child: const Text(
                        'Termos de Uso',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 5),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já tem conta?'),
                    InkWell(
                      onTap: () {
                        // Ação ao clicar em "Fazer Login"
                      },
                      child: const Text(
                        ' Fazer Login',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),



                const SizedBox(height: 20),
                Button(
                  viewModel: ButtonViewModel(
                    buttonText: 'Continuar',
                    fillColor: Colors.deepPurple,
                    onPressed: () {
                      // Ação ao clicar em "Continuar"
                    },
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