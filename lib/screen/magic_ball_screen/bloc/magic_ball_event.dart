part of 'magic_ball_bloc.dart';

sealed class MagicBallEvent extends Equatable {}

// Создаем Event событие "Загрузка списка крипты"
class LoadMagicBallMessage extends MagicBallEvent {
  @override
  List<Object?> get props => [];
}
