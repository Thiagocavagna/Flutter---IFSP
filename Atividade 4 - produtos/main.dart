import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achocolatado Mais Barato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController quantidadeControllerA = TextEditingController();
  TextEditingController valorControllerA = TextEditingController();
  TextEditingController quantidadeControllerB = TextEditingController();
  TextEditingController valorControllerB = TextEditingController();

  String resultado = '';

  void calcularAchocolatadoMaisBarato() {
    int quantidadeA = int.tryParse(quantidadeControllerA.text) ?? 0;
    double precoA = double.tryParse(valorControllerA.text) ?? 0.0;
    int quantidadeB = int.tryParse(quantidadeControllerB.text) ?? 0;
    double precoB = double.tryParse(valorControllerB.text) ?? 0.0;

    double custoTotalA = quantidadeA * precoA;
    double custoTotalB = quantidadeB * precoB;

    if (custoTotalA < custoTotalB) {
      setState(() {
        resultado = 'Mais barato: Achocolatado A';
      });
    } else if (custoTotalB < custoTotalA) {
      setState(() {
        resultado = 'Mais barato: Achocolatado B';
      });
    } else {
      setState(() {
        resultado = 'Ambos os achocolatados têm o mesmo preço';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achocolatado Mais Barato'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: quantidadeControllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade Achocolatado A',
              ),
            ),
            TextField(
              controller: valorControllerA,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço Achocolatado A',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: quantidadeControllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade Achocolatado B',
              ),
            ),
            TextField(
              controller: valorControllerB,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Preço Achocolatado B',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calcularAchocolatadoMaisBarato();
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
