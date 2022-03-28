part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupUserEvent extends SignupEvent {
  SignupUserEvent({
    required this.email,
    required this.password,
  });

  final String email, password;

  @override
  List<Object?> get props => [email, password];
}
