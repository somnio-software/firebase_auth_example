import 'package:auth_example/login/bloc/login_bloc.dart';
import 'package:auth_example/login/view/login_view.dart';
import 'package:auth_example/signup/bloc/signup_bloc.dart';
import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthService _authService = FirebaseAuthService(
    authService: FirebaseAuth.instance,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(authService: _authService),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(authService: _authService),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: LoginView(),
      ),
    );
  }
}
