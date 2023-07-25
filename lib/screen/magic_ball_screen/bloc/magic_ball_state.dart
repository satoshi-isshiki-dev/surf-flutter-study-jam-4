part of 'magic_ball_bloc.dart';

sealed class MagicBallState extends Equatable {}

class MagicBallMessageInitial extends MagicBallState {
  @override
  List<Object?> get props => [];
}

//  - Загружаем данные из сети
class MagicBallMessageLoading extends MagicBallState {
  @override
  List<Object?> get props => [];
}

//  - Загрузили данные из сети
class MagicBallMessageLoaded extends MagicBallState {
  final String reading;

  MagicBallMessageLoaded({required this.reading});

  @override
  List<Object?> get props => [reading];
}

//  - Ошибка при загрузке данных
class MagicBallMessageLoadingFailure extends MagicBallState {
  final Object? exception;
  MagicBallMessageLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
