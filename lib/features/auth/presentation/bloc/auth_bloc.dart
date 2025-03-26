import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignupUsecase signupUsecase;
  AuthBloc(this.signupUsecase) : super(AuthInitial()) {
    on<SignUpBtnEvent>(onSignUpBtnEvent);
  }

  onSignUpBtnEvent(SignUpBtnEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpRequestState: RequestState.loading));
    var result = await signupUsecase.call(request: event.signupRequestModel);

    result.fold(
      (failure) => emit(
         state.copyWith(
            signUpRequestState: RequestState.error, failure: failure)
        
      ),
      (entity) => emit(
        state.copyWith(signUpRequestState: RequestState.loaded, entity: entity),
      ),
    );
  }
}
