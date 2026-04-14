import 'package:flutter/material.dart';

class ExtratoScreen extends StatefulWidget {
  const ExtratoScreen({super.key});

  @override
  State<ExtratoScreen> createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {
  final List<Map<String, String>> movimentacoes = [
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

  void _excluirItem(int index) {
    setState(() {
      movimentacoes.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registro excluído com sucesso'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text(item['valor'] ?? ''),
              subtitle: Text(
                '${item['categoria']} - ${item['descricao']}',
              ),
              trailing: IconButton(
                onPressed: () => _excluirItem(index),
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
