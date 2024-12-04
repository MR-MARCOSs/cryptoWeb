import 'package:flutter/material.dart';
import 'components/button/button.dart';
import 'components/button/button_view_model.dart';
import 'components/input_field/input_field.dart';
import 'components/input_field/input_field_view_model.dart';
import 'package:provider/provider.dart'; // Importado
import 'tela_cryptos.dart'; // Importado
import 'components/favorites/favorites_view_model.dart';
import 'components/bottom_bar/bottom_bar_view_model.dart';
void main() {
  runApp(const MyApp()); // Agora o app inicia aqui
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastrar Tela',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
  final TextEditingController _confirmarSenhaController = TextEditingController();

  bool _aceitoTermos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Card(
              margin: const EdgeInsets.only(top: 25.3, left: 20, right: 20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 3),
                    Image.asset(
                      'assets/main_icon.png',
                      width: 160,
                      height: 160,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      viewModel: InputFieldViewModel(
                        controller: _emailController,
                        hintText: 'Email ou telefone',
                        fillColor: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                       viewModel: InputFieldViewModel(
                        controller: _senhaController,
                        hintText: 'Senha',
                        obscureText: true,
                        fillColor: Colors.grey[200]!,
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
                          onTap: () {},
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

                    Button( // Alterado
                      viewModel: ButtonViewModel(
                        buttonText: 'Continuar',
                        fillColor: Colors.deepPurple,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider(create: (_) => BottomBarViewModel()),
                                  ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
                                ],
                                child: MyHomePage(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}