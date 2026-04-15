import 'package:flutter/material.dart';
import 'dados.dart';

class ExtratoScreen extends StatefulWidget {
  const ExtratoScreen({super.key});

  @override
  State<ExtratoScreen> createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {
  @override
  Widget build(BuildContext context) {
    final transacoes = DadosApp.listarTransacoes().reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
      ),
      body: transacoes.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma transação cadastrada ainda.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: transacoes.length,
              itemBuilder: (context, index) {
                final t = transacoes[index];
                final isEntrada = t.tipo == 'entrada';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        isEntrada ? Icons.arrow_downward : Icons.arrow_upward,
                      ),
                    ),
                    title: Text(t.descricao),
                    subtitle: Text(
                      isEntrada ? 'Entrada' : 'Saída',
                    ),
                    trailing: Text(
                      'R\$ ${t.valor.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isEntrada ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
