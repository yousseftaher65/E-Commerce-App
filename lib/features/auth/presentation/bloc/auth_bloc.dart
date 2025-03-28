import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/new_password_usecase.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/reset_code_usecase.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignupUsecase signupUsecase;
  SigninUsecase signinUsecase;
  ForgotPasswordUsecase forgotPasswordUsecase;
  ResetCodeUsecase resetCodeUsecase;
  NewPasswordUsecase newPasswordUsecase;
  AuthBloc(this.signupUsecase, this.signinUsecase, this.forgotPasswordUsecase,
      this.resetCodeUsecase , this.newPasswordUsecase)
      : super(AuthInitial()) {
    on<SignUpBtnEvent>(onSignUpBtnEvent);
    on<SigninBtnEvent>(onSigninBtnEvent);
    on<ForgotPasswordBtnEvent>(onforgotPasswordBtnEvent);
    on<ResetCodeBtnEvent>(onResetCodeBtnEvent);
    on<NewPasswordBtnEvent>(onNewPasswordBtnEvent);
  }

  onSignUpBtnEvent(SignUpBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpRequestState: RequestState.loading));
    var result = await signupUsecase.call(request: event.signupRequestModel);

    result.fold(
      (failure) => emit(state.copyWith(
          signUpRequestState: RequestState.error, failure: failure)),
      (entity) => emit(
        state.copyWith(signUpRequestState: RequestState.loaded, entity: entity),
      ),
    );
  }

  onSigninBtnEvent(SigninBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signinRequestState: RequestState.loading));
    var result =
        await signinUsecase.call(email: event.email, password: event.password);

    result.fold(
        (failure) => emit(state.copyWith(
            signinRequestState: RequestState.error, failure: failure)),
        (entity) => emit(state.copyWith(
            signinRequestState: RequestState.loaded, entity: entity)));
  }

  onforgotPasswordBtnEvent(
      ForgotPasswordBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(forgotPasswordRequestState: RequestState.loading));
    var result = await forgotPasswordUsecase.call(email: event.email);

    result.fold(
        (failure) => emit(state.copyWith(
            forgotPasswordRequestState: RequestState.error, failure: failure)),
        (entity) => emit(state.copyWith(
            forgotPasswordRequestState: RequestState.loaded, entity: entity)));
  }

  onResetCodeBtnEvent(ResetCodeBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetCodeRequestState: RequestState.loading));
    var result = await resetCodeUsecase.call(resetCode: event.resetCode);
    result.fold(
        (failure) => emit(state.copyWith(
            resetCodeRequestState: RequestState.error, failure: failure)),
        (model) => emit(state.copyWith(
            resetCodeRequestState: RequestState.loaded,
            resetCodeResponseModel: model)));
  }

  onNewPasswordBtnEvent(
      NewPasswordBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(newPasswordRequestState: RequestState.loading));
    var result =
        await newPasswordUsecase.call(email: event.email, newPassword: event.newPassword);

    result.fold(
        (failure) => emit(state.copyWith(
            newPasswordRequestState: RequestState.error, failure: failure)),
        (entity) => emit(state.copyWith(
            newPasswordRequestState: RequestState.loaded, entity: entity)));
  }
}
