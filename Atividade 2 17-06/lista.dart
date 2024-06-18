import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  List<String> dias = [
    'domingo',
    'segunda',
    'terça',
    'quarta',
    'quinta',
    'sexta',
    'sábado'
  ];

  Lista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dias.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Text(dias[index]),
                const SizedBox(height: 30),
              ],
            ),
          ],
        );
      },
    );
  }
}
