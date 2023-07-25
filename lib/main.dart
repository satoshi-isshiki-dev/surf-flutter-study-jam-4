import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball/magic_ball_repository.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ! С помощью СервисЛокатора GetIt создаем синглтон и регистрируем репозиторий MagicBallRepository для работы с загрузкой сообщений по сети
  GetIt.I.registerLazySingleton<MagicBallRepository>(
    () => MagicBallRepository(),
  );

  runApp(const MyApp());
}
