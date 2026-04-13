import 'package:flutter/material.dart';

void main() {
  runApp(MeuLucroApp());
}

class MeuLucroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Lucro MEI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double saldo = 0.0;
    double entradas = 0.0;
    double saidas = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Lucro MEI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Saldo Atual'),
                subtitle: Text('R\$ ${saldo.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text('Entradas do mês'),
                subtitle: Text('R\$ ${entradas.toStringAsFixed(2)}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Saídas do mês'),
                subtitle: Text('R\$ ${saidas.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Nova Entrada'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Nova Saída'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ver Extrato'),
            ),
          ],
        ),
      ),
    );
  }
}
