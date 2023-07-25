import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball/magic_ball_repository.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

// ! Решил для управления состоянием использовать BLoC в его очень простой реализации
// Один Event - загрузка данных из сети [LoadMagicBallMessag]
// Несколько состояний для этого события:
//  - Загружаем данные из сети [MagicBallMessageLoading]
//  - Загрузили данные из сети [MagicBallMessageLoaded]
//  - Ошибка при загрузке данных [MagicBallMessageLoadingFailure]

// В классах использую пакет Equatable для правильного сравнения объектов и в целом повышения производительности приложения, дабы лишний раз не перерисовывались виджеты.

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(MagicBallMessageInitial()) {
    on<LoadMagicBallMessage>((event, emit) async {
      final magicBallRepository = GetIt.I<MagicBallRepository>();
      try {
        if (state is! MagicBallMessageLoaded) {
          emit(MagicBallMessageLoading());
        }
        final magicBall = await magicBallRepository.getMagicBall();
        emit(MagicBallMessageLoaded(reading: magicBall.reading));
      } catch (e) {
        emit(MagicBallMessageLoadingFailure(exception: e));
      }
    });
  }
}
