import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/widgets/magic_ball_widget.dart';

import 'widgets/magic_ball_message.dart';

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
    // ! Инициализируем ShakeDetector и ... "тряси тряси смартфон"
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
              // ! Если cостояние MagicBallMessageLoaded, значит данные загрузились без ошибок, можно показать их на экране
              if (state is MagicBallMessageLoaded) {
                return MagicBallWidget(
                  magicBallItems: [
                    Image.asset('assets/images/ball.png', fit: BoxFit.contain),
                    MagicBallMessage(msg: state.reading, isError: false),
                  ],
                  magicBallBloc: magicBallBloc,
                  error: false,
                );
              }
              // ! Если cостояние MagicBallMessageLoadingFailure, значит есть ошибки, показываем красный шар
              if (state is MagicBallMessageLoadingFailure) {
                return MagicBallWidget(
                  magicBallItems: [
                    ..._magicBallImageList(errorImage: true),
                    MagicBallMessage(
                        msg: state.exception.toString(), isError: true),
                  ],
                  magicBallBloc: magicBallBloc,
                  error: true,
                );
              }
              // ! В самом начале показываем шар со свездами ✨ по которому нужно жмать
              return MagicBallWidget(
                magicBallBloc: magicBallBloc,
                magicBallItems: _magicBallImageList(errorImage: false),
                error: false,
              );
            },
          ),
        ),
      ),
    );
  }

  // Такое ... потому что время уже кончалось 😓
  List<Widget> _magicBallImageList({required bool errorImage}) {
    return [
      Image.asset('assets/images/${errorImage ? 'eball.png' : 'ball.png'}',
          fit: BoxFit.contain),
      Image.asset('assets/images/star.png', fit: BoxFit.contain),
      Image.asset('assets/images/small.png', fit: BoxFit.contain),
    ];
  }
}
