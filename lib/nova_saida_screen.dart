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
    final descricao = _descricaoController.text.trim();
    final valor =
        double.tryParse(_valorController.text.replaceAll(',', '.')) ?? 0;

    if (descricao.isEmpty || valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha a descrição e informe um valor válido.'),
        ),
      );
      return;
    }

    DadosApp.adicionarSaida(descricao, valor);
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Saída'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _salvarSaida,
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
