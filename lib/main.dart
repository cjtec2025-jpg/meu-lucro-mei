import 'package:flutter/material.dart';
import 'nova_entrada_screen.dart';
import 'nova_saida_screen.dart';

void main() {
  runApp(const MeuLucroApp());
}

class MeuLucroApp extends StatelessWidget {
  const MeuLucroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Lucro MEI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Lucro MEI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Cards de resumo
            const _ResumoCard(
              titulo: 'Saldo atual',
              valor: 0.0,
              destaque: true,
            ),
            const SizedBox(height: 12),
            const _ResumoCard(
              titulo: 'Entradas do mês',
              valor: 0.0,
            ),
            const SizedBox(height: 12),
            const _ResumoCard(
              titulo: 'Saídas do mês',
              valor: 0.0,
            ),

            const SizedBox(height: 20),

            // Botões
            _AcaoButton(
              texto: 'Nova Entrada',
              icone: Icons.add,
              cor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NovaEntradaScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _AcaoButton(
              texto: 'Nova Saída',
              icone: Icons.remove,
              cor: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NovaSaidaScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _AcaoButton(
              texto: 'Ver Extrato',
              icone: Icons.list,
              cor: Colors.blue,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// =======================
// CARD DE RESUMO
// =======================

class _ResumoCard extends StatelessWidget {
  final String titulo;
  final double valor;
  final bool destaque;

  const _ResumoCard({
    required this.titulo,
    required this.valor,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    final valorStyle = TextStyle(
      fontSize: destaque ? 26 : 20,
      fontWeight: FontWeight.bold,
      color: destaque ? Colors.blue : Colors.black,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: destaque ? Colors.blue.withOpacity(0.1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo),
          const SizedBox(height: 8),
          Text(
            'R\$ ${valor.toStringAsFixed(2)}',
            style: valorStyle,
          ),
        ],
      ),
    );
  }
}

// =======================
// BOTÃO DE AÇÃO
// =======================

class _AcaoButton extends StatelessWidget {
  final String texto;
  final IconData icone;
  final Color cor;
  final VoidCallback onTap;

  const _AcaoButton({
    required this.texto,
    required this.icone,
    required this.cor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icone, color: Colors.white),
        label: Text(
          texto,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
