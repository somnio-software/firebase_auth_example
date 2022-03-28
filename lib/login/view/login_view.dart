import 'package:auth_example/login/bloc/login_bloc.dart';
import 'package:auth_example/signup/view/signup_page.dart';
import 'package:auth_example/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late final LoginBloc _loginBloc;

  void onPressed() {
    _loginBloc.add(
      LoginUserEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LoginEmail(emailController: _emailController),
              const SizedBox(height: 30.0),
              _LoginPassword(passwordController: _passwordController),
              const SizedBox(height: 30.0),
              _SubmitButton(onPressed: onPressed),
              const SizedBox(height: 30.0),
              _CreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginEmail extends StatelessWidget {
  _LoginEmail({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        controller: emailController,
        decoration: const InputDecoration(hintText: 'Email'),
      ),
    );
  }
}

class _LoginPassword extends StatelessWidget {
  _LoginPassword({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Login'),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignupPage(),
          ),
        );
      },
      child: const Text('Create Account'),
    );
  }
}
