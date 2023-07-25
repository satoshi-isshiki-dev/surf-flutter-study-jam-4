import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/widgets/magic_ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _magicBallBloc = MagicBallBloc();

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(16, 12, 43, 1),
              Colors.black,
            ],
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: BlocBuilder(
                bloc: _magicBallBloc,
                builder: (context, state) {
                  if (state is MagicBallMessageLoaded) {
                    return MagicBallWidget(
                        magicBallBloc: _magicBallBloc,
                        magicBallItems: [
                          Image.asset('assets/images/ball.png',
                              fit: BoxFit.contain),
                          Text(
                            state.reading,
                            style: const TextStyle(
                              fontSize: 32.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                        error: false);
                  }
                  if (state is MagicBallMessageLoadingFailure) {
                    return MagicBallWidget(
                        magicBallBloc: _magicBallBloc,
                        magicBallItems: [
                          Image.asset('assets/images/error/ball.png',
                              fit: BoxFit.contain),
                          Image.asset('assets/images/star.png',
                              fit: BoxFit.contain),
                          Image.asset('assets/images/small star.png',
                              fit: BoxFit.contain),
                        ],
                        error: true);
                  }
                  return MagicBallWidget(
                      magicBallBloc: _magicBallBloc,
                      magicBallItems: [
                        Image.asset('assets/images/ball.png',
                            fit: BoxFit.contain),
                        Image.asset('assets/images/star.png',
                            fit: BoxFit.contain),
                        Image.asset('assets/images/small star.png',
                            fit: BoxFit.contain),
                      ],
                      error: false);
                })),
      ),
    );
  }
}
