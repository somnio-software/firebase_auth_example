part of 'signup_bloc.dart';

enum SignupStatus {
  success,
  failure,
}

class SignupState extends Equatable {
  SignupState({
    this.message = '',
    this.status = SignupStatus.success,
  });

  final String message;
  final SignupStatus status;

  @override
  List<Object?> get props => [];
}
