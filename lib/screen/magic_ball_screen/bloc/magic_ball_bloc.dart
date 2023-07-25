import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/repositories/magic_ball/magic_ball_repository.dart';

part 'magic_ball_event.dart';
part 'magic_ball_state.dart';

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
