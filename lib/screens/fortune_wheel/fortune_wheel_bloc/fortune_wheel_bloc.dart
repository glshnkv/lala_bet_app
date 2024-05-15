import 'package:bloc/bloc.dart';
import 'package:lala_bet_app/screens/fortune_wheel/fortune_wheel_screen.dart';
import 'package:lala_bet_app/services/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'fortune_wheel_event.dart';
part 'fortune_wheel_state.dart';

class FortuneWheelBloc extends Bloc<FortuneWheelEvent, FortuneWheelState> {
  FortuneWheelBloc() : super(FortuneWheelInitial()) {
    on<GetFortuneBonusEvent>(_getFortuneBonusHandler);
    on<CheckFortuneWheelEvent>(_checkFortuneWheelHandler);
  }

  void _checkFortuneWheelHandler(
      CheckFortuneWheelEvent event, Emitter<FortuneWheelState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();
    final int currentTime = DateTime.now().millisecondsSinceEpoch;
    final int twentyFourHours = 24 * 60 * 60 * 1000;

    if (currentTime - storage.lastFortuneTime >= twentyFourHours) {
      emit(SuccessFortuneWheelState());
    } else {
      final int _timeLeft =
          twentyFourHours - (currentTime - storage.lastFortuneTime);
      emit(FailureFortuneWheelState(timeLeft: _timeLeft));
    }
  }

  void _getFortuneBonusHandler(
      GetFortuneBonusEvent event, Emitter<FortuneWheelState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();
    final int currentTime = DateTime.now().millisecondsSinceEpoch;
    final int twentyFourHours = 24 * 60 * 60 * 1000;
    if (event.type == BonusType.coins) {
      storage.coins += event.value;
    } else {
      storage.hearts += event.value;
    }
    storage.lastFortuneTime = currentTime;
    final int _timeLeft =
        twentyFourHours - (currentTime - storage.lastFortuneTime);
    emit(FailureFortuneWheelState(timeLeft: _timeLeft));
  }
}
