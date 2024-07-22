import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({super.key});

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Método:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        DropdownMenu<int>(
          initialSelection: 1,
          onSelected: (int? valor) {},
          dropdownMenuEntries: const [
          DropdownMenuEntry(label: 'Cartão Crédito', value: 1),
        ])
      ],
    );
  }
}
