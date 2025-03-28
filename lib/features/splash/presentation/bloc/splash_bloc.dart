import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/helpers/check_internet_connection.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<Init>(_onInit);

    on<CheckInternetConnectionEvent>(_onCheckInternetConnectionEvent);
  }

  Future<void> _onInit(Init event, Emitter<SplashState> emit) async {
    bool isFirstTime = SharedPreferenceHelper.getBool('onBoarding' , defaultValue: true) ?? false;
    String token = SharedPreferenceHelper.getString('token') ?? '';
    emit(SplashLoadedState(isFirstTime: isFirstTime , token: token));
  }

  Future<void> _onCheckInternetConnectionEvent(
      CheckInternetConnectionEvent event, Emitter<SplashState> emit) async {
    final isConnected = await CheckInternetConnection().checkConnectivity();

    if (isConnected) {
      add(Init());
    } else {
      emit(NoInternetState());
    }
  }
}
