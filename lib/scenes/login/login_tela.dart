import 'package:cryptos/main.dart';
import 'package:flutter/material.dart';
import '../../components/button/button.dart';
import '../../components/button/button_view_model.dart';
import '../../components/input_field/input_field.dart';
import '../../components/input_field/input_field_view_model.dart';
import 'package:provider/provider.dart'; // Import necessário
import '../home_page/tela_cryptos.dart';
import '../../components/favorites/favorites_view_model.dart';
import '../../components/bottom_bar/bottom_bar_view_model.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginTela(),
    );
  }
}

class LoginTela extends StatefulWidget {
  const LoginTela({super.key});

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

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
                    const SizedBox(
                        height: 3), // Espaçamento para o título externo
                    // Substituindo o CircleAvatar por Image.asset
                    Image.asset(
                      'assets/main_icon.png',
                      width:
                          160, // Defina o tamanho da imagem conforme necessário
                      height: 160,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      // Substitua pelo seu componente InputField
                      viewModel: InputFieldViewModel(
                        controller: _emailController,
                        hintText: 'Email ou telefone',
                        fillColor: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      // Substitua pelo seu componente InputField
                      viewModel: InputFieldViewModel(
                        controller: _senhaController,
                        hintText: 'Senha',
                        obscureText: true,
                        fillColor: Colors.grey[200]!,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('Não tem uma conta? '),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastrarTela()),
                            );
                          }, // Adicione a ação aqui
                          child: const Text(
                            'Fazer cadastro',
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
                          // Navegação para a tela principal (MyHomePage)
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider(
                                      create: (_) => BottomBarViewModel()),
                                  ChangeNotifierProvider(
                                      create: (_) => FavoritesViewModel()),
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
                'Entrar',
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
