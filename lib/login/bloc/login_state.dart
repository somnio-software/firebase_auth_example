part of 'login_bloc.dart';

enum LoginStatus {
  success,
  failure,
}

class LoginState extends Equatable {
  LoginState({
    this.message = '',
    this.status = LoginStatus.success,
  });

  final String message;
  final LoginStatus status;

  @override
  List<Object?> get props => [];
}
