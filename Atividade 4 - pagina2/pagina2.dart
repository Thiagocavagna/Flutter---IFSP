import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final TextEditingController _controlaNome = TextEditingController();
  String _notaDigitada = "";
  String _Resultado = "";

  void _calcula() {
    var nota = double.tryParse(_notaDigitada);
    if (nota != null) {
      if (nota >= 6) {
        _Resultado = '${_controlaNome.text} foi Aprovado!';
      } else {
        _Resultado = "${_controlaNome.text} foi Reprovado!";
      }
    } else {
      _Resultado = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado:'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Nome:'),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controlaNome,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Nota:'),
              SizedBox(
                width: 100,
                child: TextField(
                  onChanged: (String valor) {
                    _notaDigitada = valor;
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _calcula();
                });
              },
              child: const Text("Resultado")),
          Row(
            children: [
              Text(_Resultado),
            ],
          ),
        ],
      ),
    );
  }
}
