import 'package:flutter/material.dart';

class NovaEntradaScreen extends StatefulWidget {
  const NovaEntradaScreen({super.key});

  @override
  State<NovaEntradaScreen> createState() => _NovaEntradaScreenState();
}

class _NovaEntradaScreenState extends State<NovaEntradaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();

  String? _categoriaSelecionada;

  final List<String> _categorias = [
    'Serviços',
    'Vendas',
    'Comissão',
    'Outro',
  ];

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarEntrada() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entrada salva com sucesso')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Entrada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  prefixText: 'R\$ ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um valor válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha a descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _categoriaSelecionada,
                hint: const Text('Categoria'),
                items: _categorias.map((c) {
                  return DropdownMenuItem(
                    value: c,
                    child: Text(c),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _categoriaSelecionada = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Selecione uma categoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarEntrada,
                child: const Text('Salvar Entrada'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
