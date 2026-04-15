class Transacao {
  final String tipo; // "entrada" ou "saida"
  final String descricao;
  final double valor;

  Transacao({
    required this.tipo,
    required this.descricao,
    required this.valor,
  });
}

class DadosApp {
  static final List<Transacao> transacoes = [];

  static void adicionar(Transacao t) {
    transacoes.add(t);
  }

  static void adicionarEntrada(String descricao, double valor) {
    transacoes.add(
      Transacao(
        tipo: 'entrada',
        descricao: descricao,
        valor: valor,
      ),
    );
  }

  static void adicionarSaida(String descricao, double valor) {
    transacoes.add(
      Transacao(
        tipo: 'saida',
        descricao: descricao,
        valor: valor,
      ),
    );
  }

  static List<Transacao> listarTransacoes() {
    return transacoes;
  }

  static double totalEntradas() {
    double total = 0;
    for (var t in transacoes) {
      if (t.tipo == 'entrada') {
        total += t.valor;
      }
    }
    return total;
  }

  static double totalSaidas() {
    double total = 0;
    for (var t in transacoes) {
      if (t.tipo == 'saida') {
        total += t.valor;
      }
    }
    return total;
  }

  static double lucroAtual() {
    return totalEntradas() - totalSaidas();
  }

  static void removerTransacao(int index) {
    if (index >= 0 && index < transacoes.length) {
      transacoes.removeAt(index);
    }
  }

  static void limparTudo() {
    transacoes.clear();
  }
}
