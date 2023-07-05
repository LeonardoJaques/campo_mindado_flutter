import 'dart:math';

import 'package:campo_minado_flutter/models/campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdeBombas;

  final List<Campo> _campos = [];

  Tabuleiro({
    required this.linhas,
    required this.colunas,
    required this.qtdeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }

  void reiniciar() {
    _campos.forEach((campo) => campo.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    _campos.forEach((campo) => campo.revelarBomba());
  }

  void relacionarVizinhos() {
    for (var campo in _campos) {
      for (var vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _criarCampos() {
    for (int l = 0; l < linhas; l++) {
      for (int c = 0; c < colunas; c++) {
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }

  void _sortearMinas() {
    int sorteados = 0;
    if (qtdeBombas > linhas * colunas) {
      return;
    }
    while (sorteados < qtdeBombas) {
      int i = 0;
      i = Random().nextInt(_campos.length);
      if (!_campos[i].minado) {
        _campos[i].minar();
        sorteados++;
      }
    }
  }

  void _relacionarVizinhos() {
    for (var campo1 in _campos) {
      for (var campo2 in _campos) {
        campo1.adicionarVizinho(campo2);
      }
    }
  }

  List<Campo> get campos => _campos;
  bool get resolvido => _campos.every((campo) => campo.resolvido);
}
