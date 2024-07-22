import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Media(),
  ));
}

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  TextEditingController _controlerNome = TextEditingController();
  TextEditingController _controlerNota1 = TextEditingController();
  TextEditingController _controlerNota2 = TextEditingController();
  TextEditingController _controlerNota3 = TextEditingController();
  TextEditingController _controlerNota4 = TextEditingController();

  List<String> _list = [];

  String _resultado = "";
  double _media = 0.0;

  void _limpar() {
    _controlerNome.clear();
    _controlerNota1.clear();
    _controlerNota2.clear();
    _controlerNota3.clear();
    _controlerNota4.clear();

    setState(() {
      _list = List.empty();
    });
  }

  void _calcula() {
    setState(() {
      double total = 0.0;

      total += double.parse(_controlerNota1.text.replaceAll(',', '.'));
      total += double.parse(_controlerNota2.text.replaceAll(',', '.'));
      total += double.parse(_controlerNota3.text.replaceAll(',', '.'));
      total += double.parse(_controlerNota4.text.replaceAll(',', '.'));

      _media = total / 4;
      _resultado =
          '${_controlerNome.text} obteve nota: ${_media.toString().replaceAll('.', ',')}';

      _list.add(_resultado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Média: '),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('Nome: '),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _controlerNome,
                ),
              ),
            ],
          ),
          linhaNota('Nota 1:', _controlerNota1),
          linhaNota('Nota 2:', _controlerNota2),
          linhaNota('Nota 3:', _controlerNota3),
          linhaNota('Nota 4:', _controlerNota4),
          ElevatedButton(
            onPressed: () {
              _calcula();

              String result = "";
              if (_media >= 6) {
                result = "Você foi aprovado!";
              } else {
                result = "Você foi reprovado!";
              }

              final snackBar = SnackBar(
                content: Text(result),
                action: SnackBarAction(
                  label: 'Limpar',
                  onPressed: () {
                    _limpar();
                  },
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Calcular'),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_list[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row linhaNota(String texto, TextEditingController controller) {
    return Row(
      children: [
        Text(texto),
        SizedBox(
          width: 200,
          child: TextField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
