// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/auth/data/datasources/auth_data_source.dart' as _i703;
import 'features/auth/data/datasources/auth_data_source_imple.dart' as _i25;
import 'features/auth/data/repositories/auth_repo_imple.dart' as _i384;
import 'features/auth/domain/repositories/auth_repo.dart' as _i416;
import 'features/auth/domain/usecases/forgot_password_usecase.dart' as _i993;
import 'features/auth/domain/usecases/new_password_usecase.dart' as _i1010;
import 'features/auth/domain/usecases/reset_code_usecase.dart' as _i476;
import 'features/auth/domain/usecases/signin_usecase.dart' as _i925;
import 'features/auth/domain/usecases/signup_usecase.dart' as _i100;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i703.AuthDataSource>(
        () => _i25.AuthDataSourceImple(apiManager: gh<_i237.ApiManager>()));
    gh.factory<_i416.AuthRepo>(
        () => _i384.AuthRepoImple(authDS: gh<_i703.AuthDataSource>()));
    gh.factory<_i100.SignupUsecase>(
        () => _i100.SignupUsecase(authRepo: gh<_i416.AuthRepo>()));
    gh.factory<_i925.SigninUsecase>(
        () => _i925.SigninUsecase(authRepo: gh<_i416.AuthRepo>()));
    gh.factory<_i993.ForgotPasswordUsecase>(
        () => _i993.ForgotPasswordUsecase(authRepo: gh<_i416.AuthRepo>()));
    gh.factory<_i476.ResetCodeUsecase>(
        () => _i476.ResetCodeUsecase(authRepo: gh<_i416.AuthRepo>()));
    gh.factory<_i1010.NewPasswordUsecase>(
        () => _i1010.NewPasswordUsecase(authRepo: gh<_i416.AuthRepo>()));
    gh.factory<_i363.AuthBloc>(() => _i363.AuthBloc(
          gh<_i100.SignupUsecase>(),
          gh<_i925.SigninUsecase>(),
          gh<_i993.ForgotPasswordUsecase>(),
          gh<_i476.ResetCodeUsecase>(),
          gh<_i1010.NewPasswordUsecase>(),
        ));
    return this;
  }
}
