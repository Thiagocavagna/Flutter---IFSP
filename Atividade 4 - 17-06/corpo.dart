import 'package:flutter/material.dart';
import 'package:flutter_snackbar/lista.dart';

class Corpo extends StatefulWidget {
  const Corpo({super.key});

  @override
  State<Corpo> createState() => _CorpoState();
}

class _CorpoState extends State<Corpo> {
  Lista lista = Lista();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: lista.getItens().length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(lista.getElemento(index)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('você selecionou: ${index + 1}'),
                    duration: const Duration(seconds: 10),
                    action: SnackBarAction(
                      label: 'Desfazer',
                      onPressed: () {
                        setState(() {
                          lista.remover();
                        });
                      },
                    ),
                  ),
                );
                setState(() {
                  lista.novo();
                });
              },
            ),
          );
        });
  }
}
