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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
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
    const double saldo = 1250.00;
    const double entradas = 3000.00;
    const double saidas = 1750.00;
    const double lucro = 1250.00;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Lucro MEI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _ResumoCard(
              titulo: 'Saldo atual',
              valor: saldo,
              destaque: true,
            ),
            const SizedBox(height: 12),
            _ResumoCard(
              titulo: 'Entradas do mês',
              valor: entradas,
            ),
            const SizedBox(height: 12),
            _ResumoCard(
              titulo: 'Saídas do mês',
              valor: saidas,
            ),
            const SizedBox(height: 12),
            _ResumoCard(
              titulo: 'Lucro do mês',
              valor: lucro,
            ),
            const SizedBox(height: 24),
            _AcaoButton(
              texto: 'Nova Entrada',
              icone: Icons.add,
              cor: Colors.green,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _AcaoButton(
              texto: 'Nova Saída',
              icone: Icons.remove,
              cor: Colors.red,
              onTap: () {},
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
    final TextStyle valorStyle = TextStyle(
      fontSize: destaque ? 32 : 22,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF1F3B73),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
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
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icone,
          color: Colors.white,
        ),
        label: Text(
          texto,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: cor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
