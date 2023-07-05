import 'dart:math';

import 'package:campo_minado_flutter/components/resultado_widget.dart';
import 'package:campo_minado_flutter/models/campo.dart';
import 'package:campo_minado_flutter/models/tabuleiro.dart';
import 'package:campo_minado_flutter/screens/tabuleiro_widget.dart';
import 'package:flutter/material.dart';

import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu = false;
  bool _perdeu = false;

  final Tabuleiro _tabuleiro = Tabuleiro(
    linhas: min(
        26,
        WidgetsBinding
            .instance.platformDispatcher.views.first.physicalSize.height
            .toInt()),
    colunas: 15,
    qtdeBombas: 3,
  );

  _reiniciar() {
    setState(() {
      _venceu = false;
      _perdeu = false;
      _tabuleiro.reiniciar();
    });
  }

  _abrir(Campo campo) {
    setState(() {
      if (_perdeu) return;
      try {
        campo.abrir();
        if (_tabuleiro.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {
        _perdeu = true;
        _tabuleiro.revelarBombas();
      }
    });
  }

  _alternarMarcacao(Campo campo) {
    setState(() {
      campo.alterarMarcacao();
      if (_tabuleiro.resolvido) {
        _venceu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: ResultadoWidget(
            venceu: _venceu,
            perdeu: !_venceu && _perdeu,
            onReiniciar: _reiniciar,
          ),
          body: Container(
            color: Colors.grey,
            child: LayoutBuilder(
              builder: (ctx, constraints) {
                return TabuleiroWidget(
                  tabuleiro: _tabuleiro,
                  onAbrir: _abrir,
                  onAlternarMarcacao: _alternarMarcacao,
                );
              },
            ),
          )),
    );
  }
}
