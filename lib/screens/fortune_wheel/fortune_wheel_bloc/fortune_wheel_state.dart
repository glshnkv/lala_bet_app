part of 'fortune_wheel_bloc.dart';

@immutable
sealed class FortuneWheelState {}

final class FortuneWheelInitial extends FortuneWheelState {}

class SuccessFortuneWheelState extends FortuneWheelState {}

class FailureFortuneWheelState extends FortuneWheelState {
  final int timeLeft;

  FailureFortuneWheelState({required this.timeLeft});
}