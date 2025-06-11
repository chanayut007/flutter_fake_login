import 'package:dio/dio.dart';
import 'package:fake_login/bloc/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginLocator {
  void setup() {
    GetIt.I.registerLazySingleton<LoginBloc>(() => LoginBloc(
          baseUrl: GetIt.I.get(),
          dio: GetIt.I.get(),
        ));
  }
}
