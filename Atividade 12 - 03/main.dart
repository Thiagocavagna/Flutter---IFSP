import 'package:flutter/material.dart';
import 'package:flutter_abas/tabela.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      //home: const TabBarExample(),
      home: Scaffold(body: const Tabela()),
    );
  }
}

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                // Produtos
                text: 'Produtos',
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                // Endereço
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                // Pagamento
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              // Produtos
              child: Text("It's cloudy here"),
            ),
            Center(
              // CEP
              child: Text("It's rainy here"),
            ),
            Center(
              // Pagamento
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
