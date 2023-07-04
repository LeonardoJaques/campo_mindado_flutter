import 'package:campo_minado_flutter/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir campo com explosão', () {
      final c = Campo(linha: 0, coluna: 0);
      c.minar();
      expect(c.abrir, throwsException);
    });
    test('Abrir campo sem explosão', () {
      final c = Campo(linha: 0, coluna: 0);
      c.abrir();
      expect(c.aberto, isTrue);
    });
    test('Adicionar não vizinho', () {
      final c1 = Campo(linha: 0, coluna: 0);
      final c2 = Campo(linha: 1, coluna: 3);
      c1.adicionarVizinho(c2);
      expect(c1.vizinhos.isEmpty, isTrue);
    });
    test('Adicionar vizinho', () {
      final c1 = Campo(linha: 3, coluna: 3);
      final c2 = Campo(linha: 3, coluna: 4);
      final c3 = Campo(linha: 2, coluna: 2);
      final c4 = Campo(linha: 4, coluna: 4);
      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.vizinhos.length, 3);
    });
    test('Minas na vizinhança', () {
      final c1 = Campo(linha: 3, coluna: 3);
      final c2 = Campo(linha: 3, coluna: 4);
      c2.minar();
      final c3 = Campo(linha: 2, coluna: 2);
      final c4 = Campo(linha: 4, coluna: 4);
      c4.minar();

      c1.adicionarVizinho(c2);
      c1.adicionarVizinho(c3);
      c1.adicionarVizinho(c4);
      expect(c1.qtdeMinasNaVizinhanca, 2);
    });
  });
}
