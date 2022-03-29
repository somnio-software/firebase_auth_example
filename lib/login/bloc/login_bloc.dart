import 'package:auth_service/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(LoginState()) {
    on<LoginUserEvent>(_handleLoginWithEmailAndPasswordEvent);
  }

  final AuthService _authService;

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(LoginState(message: 'Success', status: LoginStatus.success));
    } catch (e) {
      emit(LoginState(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
