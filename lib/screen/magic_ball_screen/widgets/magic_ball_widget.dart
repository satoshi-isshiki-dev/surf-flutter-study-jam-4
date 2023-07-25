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
              magicBallBloc.add(LoadMagicBallMessage());
            },
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
                error
                    ? 'assets/images/error/Ellipse 6.png'
                    : 'assets/images/Ellipse 6.png',
                fit: BoxFit.contain,
                // width: 200,
              ),
              Image.asset(
                error
                    ? 'assets/images/error/Ellipse 7.png'
                    : 'assets/images/Ellipse 7.png',
                fit: BoxFit.contain,
                // width: 200,
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
