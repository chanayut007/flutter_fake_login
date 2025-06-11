import 'package:fake_login/bloc/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginLocator {
  void setup() {
    GetIt.I.registerLazySingleton<LoginBloc>(() => LoginBloc(
          baseUrl: GetIt.I.get(),
          dio: GetIt.I.get(),
        ));
  }
}
