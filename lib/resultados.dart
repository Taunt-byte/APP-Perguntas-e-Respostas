import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoFinal;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacaoFinal, this.reiniciarQuestionario);

  String get fraseFinal {
    if (pontuacaoFinal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoFinal < 12) {
      return 'Ótimo';
    } else if (pontuacaoFinal < 20) {
      return 'Está chegando lá!';
    } else {
      return 'Você entende de futebol!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Parabéns você concluiu o questionário!\n\nSua pontuação foi: ' +
                pontuacaoFinal.toString() +
                '\n\nSua frase:\n\n' +
                fraseFinal,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar Questionário',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
