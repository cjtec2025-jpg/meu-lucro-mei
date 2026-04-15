import 'package:flutter/material.dart';
import 'dados.dart';

class NovaSaidaScreen extends StatefulWidget {
  const NovaSaidaScreen({super.key});

  @override
  State<NovaSaidaScreen> createState() => _NovaSaidaScreenState();
}

class _NovaSaidaScreenState extends State<NovaSaidaScreen> {
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  void _salvarSaida() {
    final descricao = _descricaoController.text;
    final valor = double.tryParse(_valorController.text) ?? 0;

    if (descricao.isEmpty || valor == 0) {
      return;
    }

    Dados.adicionarSaida(descricao, valor);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Saída'),
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
              onPressed: _salvarSaida,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
