part of 'magic_ball_bloc.dart';

sealed class MagicBallEvent extends Equatable {}

// Создаем Event событие "Загрузка Сообщения от магического шара 🔮"
class LoadMagicBallMessage extends MagicBallEvent {
  @override
  List<Object?> get props => [];
}
