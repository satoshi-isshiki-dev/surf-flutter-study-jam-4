import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/widgets/magic_ball_widget.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  final magicBallBloc = MagicBallBloc();
  late ShakeDetector detector;

  @override
  void initState() {
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        magicBallBloc.add(LoadMagicBallMessage());
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            bloc: magicBallBloc,
            builder: (context, state) {
              if (state is MagicBallMessageLoaded) {
                return MagicBallWidget(
                  magicBallBloc: magicBallBloc,
                  magicBallItems: [
                    Image.asset('assets/images/ball.png', fit: BoxFit.contain),
                    Text(
                      state.reading,
                      style: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                  error: false,
                );
              }
              if (state is MagicBallMessageLoadingFailure) {
                return MagicBallWidget(
                  magicBallBloc: magicBallBloc,
                  magicBallItems: [
                    Image.asset('assets/images/error/ball.png',
                        fit: BoxFit.contain),
                    Image.asset('assets/images/star.png', fit: BoxFit.contain),
                    Image.asset('assets/images/small star.png',
                        fit: BoxFit.contain),
                    Text(
                      state.exception.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                  error: true,
                );
              }
              return MagicBallWidget(
                magicBallBloc: magicBallBloc,
                magicBallItems: [
                  Image.asset('assets/images/ball.png', fit: BoxFit.contain),
                  Image.asset('assets/images/star.png', fit: BoxFit.contain),
                  Image.asset('assets/images/small star.png',
                      fit: BoxFit.contain),
                ],
                error: false,
              );
            },
          ),
        ),
      ),
    );
  }
}
