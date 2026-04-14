class Transacao {
  final String tipo;
  final String descricao;
  final double valor;

  Transacao({
    required this.tipo,
    required this.descricao,
    required this.valor,
  });
}

class DadosApp {
  static List<Transacao> transacoes = [];

  static void adicionar(Transacao t) {
    transacoes.add(t);
  }
}
