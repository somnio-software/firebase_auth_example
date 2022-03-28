import 'package:auth_service/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(SignupInitial()) {
    on<SignupUserEvent>(_handleCreateAccountEvent);
  }
  final AuthService _authService;

  Future<void> _handleCreateAccountEvent(
    SignupUserEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(SignupSuccessState());
    } catch (e) {
      emit(
        SignupFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
