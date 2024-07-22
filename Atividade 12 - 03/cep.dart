import 'package:flutter/material.dart';

class CEP extends StatefulWidget {
  const CEP({super.key});

  @override
  State<CEP> createState() => _CEPState();
}

class _CEPState extends State<CEP> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text('CEP:'),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '14780-000',
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
