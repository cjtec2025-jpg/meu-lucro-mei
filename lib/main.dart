import 'package:flutter/material.dart';
import 'dados.dart';
import 'nova_entrada_screen.dart';
import 'nova_saida_screen.dart';
import 'extrato_screen.dart';

void main() {
  runApp(const MeuLucroApp());
}

class MeuLucroApp extends StatelessWidget {
  const MeuLucroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Lucro MEI',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _abrirNovaEntrada() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NovaEntradaScreen(),
      ),
    );

    if (resultado == true) {
      setState(() {});
    }
  }

  Future<void> _abrirNovaSaida() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NovaSaidaScreen(),
      ),
    );

    if (resultado == true) {
      setState(() {});
    }
  }

  Future<void> _abrirExtrato() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ExtratoScreen(),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final entradas = DadosApp.totalEntradas();
    final saidas = DadosApp.totalSaidas();
    final lucro = DadosApp.lucroAtual();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Lucro MEI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ResumoCard(
              titulo: 'Saldo atual',
              valor: lucro,
              destaque: true,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ResumoCard(
                    titulo: 'Entradas do mês',
                    valor: entradas,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ResumoCard(
                    titulo: 'Saídas do mês',
                    valor: saidas,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AcaoButton(
              texto: 'Nova Entrada',
              icone: Icons.add,
              cor: Colors.green,
              onTap: _abrirNovaEntrada,
            ),
            const SizedBox(height: 12),
            AcaoButton(
              texto: 'Nova Saída',
              icone: Icons.remove,
              cor: Colors.red,
              onTap: _abrirNovaSaida,
            ),
            const SizedBox(height: 12),
            AcaoButton(
              texto: 'Ver Extrato',
              icone: Icons.list,
              cor: Colors.blue,
              onTap: _abrirExtrato,
            ),
            const SizedBox(height: 24),
            if (DadosApp.listarTransacoes().isEmpty)
              const Text(
                'Adicione entradas e saídas para acompanhar seu lucro.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

class ResumoCard extends StatelessWidget {
  final String titulo;
  final double valor;
  final bool destaque;

  const ResumoCard({
    super.key,
    required this.titulo,
    required this.valor,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    final valorStyle = TextStyle(
      fontSize: destaque ? 26 : 20,
      fontWeight: FontWeight.bold,
      color: destaque ? Colors.green : Colors.black,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: destaque ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: destaque ? Colors.green.shade200 : Colors.grey.shade300,
        ),
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

class AcaoButton extends StatelessWidget {
  final String texto;
  final IconData icone;
  final Color cor;
  final VoidCallback onTap;

  const AcaoButton({
    super.key,
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
        icon: Icon(
          icone,
          color: Colors.white,
        ),
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
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
