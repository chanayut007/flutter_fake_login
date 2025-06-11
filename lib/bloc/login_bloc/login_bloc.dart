import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio;
  final String baseUrl;

  LoginBloc({required this.baseUrl, required this.dio})
      : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) {
      emit(LoginLoading());

      login(event.username, event.password);
    });
  }

  // Create function to call api login with username and password with baseUrl by using dio
  Future<void> login(String username, String password) async {
    try {
      final response = await dio
          .post('/login', data: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        emit(LoginSuccess(response.data['token']));
      } else {
        emit(LoginFailure('Login failed'));
      }
    } catch (e) {
      emit(LoginFailure('An error occurred: $e'));
    }
  }
}
