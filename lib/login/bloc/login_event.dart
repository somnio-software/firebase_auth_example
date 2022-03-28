part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  LoginUserEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
