import 'package:flutter/material.dart';
import 'dados.dart';

class NovaEntradaScreen extends StatefulWidget {
  const NovaEntradaScreen({super.key});

  @override
  State<NovaEntradaScreen> createState() => _NovaEntradaScreenState();
}

class _NovaEntradaScreenState extends State<NovaEntradaScreen> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  void _salvarEntrada() {
    final descricao = _descricaoController.text;
    final valor = double.tryParse(_valorController.text) ?? 0;

    if (descricao.isEmpty || valor == 0) {
      return;
    }

    Dados.adicionarEntrada(descricao, valor);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarEntrada,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
