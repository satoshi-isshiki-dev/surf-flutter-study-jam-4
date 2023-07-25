part of 'magic_ball_bloc.dart';

sealed class MagicBallState extends Equatable {}

class MagicBallMessageInitial extends MagicBallState {
  @override
  List<Object?> get props => [];
}

class MagicBallMessageLoading extends MagicBallState {
  @override
  List<Object?> get props => [];
}

class MagicBallMessageLoaded extends MagicBallState {
  final String reading;

  MagicBallMessageLoaded({required this.reading});

  @override
  List<Object?> get props => [reading];
}

class MagicBallMessageLoadingFailure extends MagicBallState {
  final Object? exception;
  MagicBallMessageLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
