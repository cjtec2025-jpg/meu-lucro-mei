import 'package:flutter/material.dart';

class ExtratoScreen extends StatelessWidget {
  const ExtratoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movimentacoes = [
      {
        'tipo': 'entrada',
        'valor': 'R\$ 300,00',
        'categoria': 'Serviços',
        'descricao': 'Conserto notebook',
      },
      {
        'tipo': 'saida',
        'valor': 'R\$ 50,00',
        'categoria': 'Transporte',
        'descricao': 'Uber cliente',
      },
      {
        'tipo': 'entrada',
        'valor': 'R\$ 120,00',
        'categoria': 'Vendas',
        'descricao': 'Produto X',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movimentacoes.length,
        itemBuilder: (context, index) {
          final item = movimentacoes[index];
          final bool isEntrada = item['tipo'] == 'entrada';

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                isEntrada ? Icons.add_circle : Icons.remove_circle,
                color: isEntrada ? Colors.green : Colors.red,
              ),
              title: Text(item['valor']!),
              subtitle: Text(
                '${item['categoria']} - ${item['descricao']}',
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
