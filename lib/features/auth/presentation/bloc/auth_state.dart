part of 'auth_bloc.dart';

class AuthState {
  RequestState? signUpRequestState;
  RequestState? signinRequestState;
  AuthResponseEntity? entity;
  Failure? failure;
  AuthState({this.signUpRequestState, this.entity, this.failure , this.signinRequestState});

  AuthState copyWith({
    RequestState? signUpRequestState,
    RequestState? signinRequestState,
    AuthResponseEntity? entity,
    Failure? failure,
  }) {
    return AuthState(
      signUpRequestState: signUpRequestState ?? this.signUpRequestState,
      signinRequestState: signinRequestState ?? this.signinRequestState,
      entity: entity ?? this.entity,
      failure: failure ?? this.failure,
    );
  }
}

class AuthInitial extends AuthState {
  AuthInitial() : super(signUpRequestState: RequestState.init , signinRequestState: RequestState.init);
}

/// Represents the state of a request.
enum RequestState {
  /// The request has not started yet.
  init,

  /// The request is currently in progress.
  loading,

  /// The request has completed successfully.
  loaded,

  /// The request has failed with an error.
  error,
}
