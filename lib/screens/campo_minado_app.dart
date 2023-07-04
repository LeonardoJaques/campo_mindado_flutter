import 'package:campo_minado_flutter/components/campo_widget.dart';
import 'package:campo_minado_flutter/components/resultado_widget.dart';
import 'package:campo_minado_flutter/models/campo.dart';
import 'package:campo_minado_flutter/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  _reiniciar() {
    print('Reiniciar...');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();
    Campo vizinho2 = Campo(linha: 1, coluna: 1);
    vizinho2.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);
    campo.adicionarVizinho(vizinho2);
    try {
      // campo.minar();
      campo.alterarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          perdeu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
            child: CampoWidget(
          campo: campo,
          onAbrir: (campo) => campo.abrir(),
          onAlternarMarcacao: (campo) => campo.alterarMarcacao(),
        )),
      ),
    );
  }
}
