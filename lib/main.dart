import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball/magic_ball_repository.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton<MagicBallRepository>(
    () => MagicBallRepository(),
  );

  runApp(const MyApp());
}
