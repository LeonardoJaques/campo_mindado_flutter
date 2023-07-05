import 'package:campo_minado_flutter/components/resultado_widget.dart';
import 'package:campo_minado_flutter/models/campo.dart';
import 'package:campo_minado_flutter/models/tabuleiro.dart';
import 'package:campo_minado_flutter/screens/tabuleiro_widget.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  _reiniciar() {
    print('Reiniciar...');
  }

  _abrir(Campo c) {
    print('Abrir...');
  }

  _alternarMarcacao(Campo c) {
    print('Alternar Marcação...');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: ResultadoWidget(
            venceu: false,
            perdeu: false,
            onReiniciar: _reiniciar,
          ),
          body: Container(
            child: TabuleiroWidget(
              tabuleiro: Tabuleiro(
                linhas: 15,
                colunas: 15,
                qtdeBombas: 10,
              ),
              onAbrir: _abrir,
              onAlternarMarcacao: _alternarMarcacao,
            ),
          )),
    );
  }
}
