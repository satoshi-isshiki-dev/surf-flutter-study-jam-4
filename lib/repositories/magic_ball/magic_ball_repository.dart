import 'package:dio/dio.dart';

import 'models/magic_ball.dart';

class MagicBallRepository {
  // final _hostName = 'https://eightballapi.com/api';
  final _pathApi = 'https://eightballapi.com/api';

  // Передаем нужные заголовки для CORS
  // Чтобы данные eightballapi.com адекватно получить
  // Без них запрос работал только на эмуляторе
  Options options = Options(headers: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET,PUT,PATCH,POST,DELETE',
    'Access-Control-Allow-Headers':
        'Origin, X-Requested-With, Content-Type, Accept',
  });

  Future<MagicBall> getMagicBall() async {
    final response = await Dio().get(_pathApi, options: options);

    final data = response.data as Map<String, dynamic>;

    // Собираем и возвращаем модельку
    return MagicBall(
      reading: data['reading'] as String,
    );
  }
}
