part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoadedState extends SplashState {
  final bool isFirstTime;
  final String token;

  SplashLoadedState({required this.isFirstTime , required this.token});

  @override
  List<Object?> get props => [isFirstTime];
}

class NoInternetState extends SplashState {}
