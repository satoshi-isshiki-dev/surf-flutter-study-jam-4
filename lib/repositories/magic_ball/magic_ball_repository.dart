import 'package:dio/dio.dart';

import 'models/magic_ball.dart';

class MagicBallRepository {
  // final _hostName = 'https://eightballapi.com/api';
  final _pathApi = 'https://eightballapi.com/api';

  Future<MagicBall> getMagicBall() async {
    final response = await Dio().get(_pathApi);

    final data = response.data as Map<String, dynamic>;

    // Собираем и возвращаем модельку
    return MagicBall(
      reading: data['reading'] as String,
    );
  }
}
