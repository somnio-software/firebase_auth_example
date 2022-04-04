import 'package:auth_example/login/bloc/login_bloc.dart';
import 'package:auth_example/login/view/login_view.dart';
import 'package:auth_service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authService: context.read<FirebaseAuthService>(),
      ),
      child: LoginView(),
    );
  }
}
