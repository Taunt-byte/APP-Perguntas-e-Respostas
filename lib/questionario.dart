import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> questoes;
  final int questaoSelecionada;
  final void Function(int) quandoResponder;

  Questionario(
      {@required this.questoes,
      @required this.questaoSelecionada,
      @required this.quandoResponder});

  bool get temPerguntaSelecionada {
    return questaoSelecionada < questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? questoes[questaoSelecionada]['respostas']
        : null;
    return Column(
      children: <Widget>[
        Questao(questoes[questaoSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoResponder(resp['nota']),
          );
        }).toList(),
      ],
    );
  }
}
