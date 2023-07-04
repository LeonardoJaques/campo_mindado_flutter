import 'package:campo_minado_flutter/models/explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _minado = false;
  bool _maximo = false;
  bool _marcado = false;
  bool _explodido = false;

  bool get aberto => _aberto;
  bool get minado => _minado;
  bool get explidido => _explodido;
  bool get marcado => _marcado;
  bool get vizinhancaSegura => vizinhos.every((v) => !v._minado);
  bool get resolvido => _minado && _marcado || !_minado && _aberto;
  bool get explodido => _minado && _aberto;

  int get qtdeMinasNaVizinhanca => vizinhos.where((v) => v.minado).length;

  Campo({
    required this.linha,
    required this.coluna,
  });

  void adicionarVizinho(Campo vizinho) {
    final deltaLinha = (linha - vizinho.linha).abs();
    final deltaColuna = (coluna - vizinho.coluna).abs();
    if (deltaLinha == 0 && deltaColuna == 0) return;
    if (deltaLinha <= 1 && deltaColuna <= 1) vizinhos.add(vizinho);
  }

  void abrir() {
    if (_aberto) return;
    _aberto = true;
    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }
    if (vizinhancaSegura) vizinhos.forEach((vizinho) => vizinho.abrir());
  }

  void revelarBomba() {
    if (_minado) _aberto = true;
  }

  void alterarMarcacao() {
    if (!_aberto) _marcado = !_marcado;
  }

  void minar() {
    _minado = true;
  }

  void reiniciar() {
    _aberto = false;
    _minado = false;
    _maximo = false;
    _marcado = false;
    _explodido = false;
  }
}
