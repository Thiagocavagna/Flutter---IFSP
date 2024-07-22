import 'dart:io';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String _usuario = 'teste';
  final String _senha = '12345678';

  String? _textoErroUsuario;

  final TextEditingController _controlaCampoUsuario = TextEditingController();
  final TextEditingController _controlaCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    controller: _controlaCampoUsuario,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'usuário',
                      errorText: _textoErroUsuario,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    controller: _controlaCampoSenha,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'senha',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Entrar'),
                ),
              ]),
        ],
      ),
    );
  }

  void onPressed() {
    if (_usuario == _controlaCampoUsuario.text) {
      if (_senha == _controlaCampoSenha.text) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        Limpar();
      }
    } else {
      setState(() {
        _textoErroUsuario = 'Usuário não encontrado!';
      });

      Limpar();
    }
  }

  void Limpar() {
    _controlaCampoSenha.text = '';
    _controlaCampoUsuario.text = '';
  }

}
