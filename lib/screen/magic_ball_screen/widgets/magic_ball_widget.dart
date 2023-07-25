import 'package:flutter/material.dart';
import '../bloc/magic_ball_bloc.dart';

class MagicBallWidget extends StatelessWidget {
  const MagicBallWidget({
    super.key,
    required this.magicBallBloc,
    required this.magicBallItems,
    required this.error,
  });

  final MagicBallBloc magicBallBloc;
  final List<Widget> magicBallItems;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: () {
              // ! По нажатию на шар добавляем событие LoadMagicBallMessage в поток (BLoC)
              magicBallBloc.add(LoadMagicBallMessage());
            },
            // ! Решил использовать Stack() для работы со "слоями" шара
            // ! Сообщение от сервера, так же будет накладываться поверх
            child: Stack(
              alignment: Alignment.center,
              children: magicBallItems,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/${error ? 'relli6.png' : 'elli6.png'}',
                fit: BoxFit.contain,
              ),
              Image.asset(
                'assets/images/${error ? 'relli7.png' : 'elli7.png'}',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(
            'Нажмите на шар\n или потрясите телефон',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(114, 114, 114, 1),
            ),
          ),
        ),
      ],
    );
  }
}
