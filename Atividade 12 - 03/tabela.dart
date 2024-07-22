import 'package:flutter/material.dart';

class Tabela extends StatelessWidget {
  const Tabela({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(100),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: const <TableRow>[
          TableRow(
            children: <Widget>[
              Text(
                'Produto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
              Text('Quant.'),
              Text('Tot'),
            ]
          ),
          TableRow(
            children: <Widget>[
              Text('Jogo de Guerra'),
              Text('1'),
              Text('R\$ 259,00'),
            ]
          ),
        ],
      ),
    );
  }
}
