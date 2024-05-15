part of 'daily_reward_bloc.dart';

@immutable
sealed class DailyRewardState {}

final class DailyRewardInitial extends DailyRewardState {}

class SuccessDailyRewardState extends DailyRewardState {}

class FailureDailyRewardState extends DailyRewardState {
  final int timeLeft;

  FailureDailyRewardState({required this.timeLeft});
}
