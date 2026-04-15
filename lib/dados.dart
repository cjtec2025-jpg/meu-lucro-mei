import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Transacao {
  final String tipo;
  final String descricao;
  final double valor;

  Transacao({
    required this.tipo,
    required this.descricao,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'descricao': descricao,
      'valor': valor,
    };
  }

  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      tipo: map['tipo'],
      descricao: map['descricao'],
      valor: (map['valor'] as num).toDouble(),
    );
  }
}

class DadosApp {
  static List<Transacao> transacoes = [];
  static const String _key = 'transacoes';

  static Future<void> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_key);

    if (jsonString != null) {
      final List lista = jsonDecode(jsonString);
      transacoes = lista.map((e) => Transacao.fromMap(e)).toList();
    }
  }

  static Future<void> salvar() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString =
        jsonEncode(transacoes.map((e) => e.toMap()).toList());

    await prefs.setString(_key, jsonString);
  }

  static Future<void> adicionarEntrada(String descricao, double valor) async {
    transacoes.add(
      Transacao(
        tipo: 'entrada',
        descricao: descricao,
        valor: valor,
      ),
    );
    await salvar();
  }

  static Future<void> adicionarSaida(String descricao, double valor) async {
    transacoes.add(
      Transacao(
        tipo: 'saida',
        descricao: descricao,
        valor: valor,
      ),
    );
    await salvar();
  }

  static List<Transacao> listarTransacoes() {
    return List.from(transacoes);
  }

  static double totalEntradas() {
    double total = 0;
    for (var t in transacoes) {
      if (t.tipo == 'entrada') total += t.valor;
    }
    return total;
  }

  static double totalSaidas() {
    double total = 0;
    for (var t in transacoes) {
      if (t.tipo == 'saida') total += t.valor;
    }
    return total;
  }

  static double lucroAtual() {
    return totalEntradas() - totalSaidas();
  }

  static Future<void> removerTransacao(int index) async {
    if (index >= 0 && index < transacoes.length) {
      transacoes.removeAt(index);
      await salvar();
    }
  }

  static Future<void> limparTudo() async {
    transacoes.clear();
    await salvar();
  }
}
