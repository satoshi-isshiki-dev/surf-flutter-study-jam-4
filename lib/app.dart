import 'package:flutter/material.dart';

import 'screen/magic_ball_screen/magic_ball_screen.dart';

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // ! Используем кастомные шрифты 'Gila Sans' как из макета
        fontFamily: 'Gila Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MagicBallScreen(),
    );
  }
}
