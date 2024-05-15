part of 'fortune_wheel_bloc.dart';

@immutable
sealed class FortuneWheelEvent {}

class GetFortuneBonusEvent extends FortuneWheelEvent {
  final BonusType type;
  final int value;

  GetFortuneBonusEvent({required this.value, required this.type});
}

class CheckFortuneWheelEvent extends FortuneWheelEvent {}
