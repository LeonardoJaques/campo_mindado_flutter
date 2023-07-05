import 'package:campo_minado_flutter/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Tabuleiro tabuleiro;
  test(
      "Deve retornar verdade quando o jogo for ganho",
      () => {
            tabuleiro = Tabuleiro(
              linhas: 2,
              colunas: 2,
              qtdeBombas: 0,
            ),
            tabuleiro.campos[0].minar(),
            tabuleiro.campos[3].minar(),

            //Jogo ganho
            tabuleiro.campos[0].alterarMarcacao(),
            tabuleiro.campos[1].abrir(),
            tabuleiro.campos[2].abrir(),
            tabuleiro.campos[3].alterarMarcacao(),

            expect(tabuleiro.resolvido, isTrue)
          }); //
}
