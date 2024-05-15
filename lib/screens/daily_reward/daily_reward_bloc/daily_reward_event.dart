part of 'daily_reward_bloc.dart';

@immutable
sealed class DailyRewardEvent {}

class GetDailyRewardEvent extends DailyRewardEvent {
  final int coins;

  GetDailyRewardEvent({required this.coins});
}

class CheckDailyRewardEvent extends DailyRewardEvent {}