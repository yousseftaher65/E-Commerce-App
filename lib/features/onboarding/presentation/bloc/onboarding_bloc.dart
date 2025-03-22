import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingComplete>(_onOnboardingComplete);
  }

  Future<void> _onOnboardingComplete(
      OnboardingComplete event, Emitter<OnboardingState> emit) async {
    await SharedPreferenceHelper.saveOnBoarding();
    emit(OnboardingFinished()); // Use a state to notify the UI
  }
}
