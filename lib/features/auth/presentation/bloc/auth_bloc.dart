import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignupUsecase signupUsecase;
  SigninUsecase signinUsecase;
  AuthBloc(this.signupUsecase, this.signinUsecase) : super(AuthInitial()) {
    on<SignUpBtnEvent>(onSignUpBtnEvent);
    on<SigninBtnEvent>(onSigninBtnEvent);
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
}
