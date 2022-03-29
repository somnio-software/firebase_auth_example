import 'package:auth_example/home/view/home_view.dart';
import 'package:auth_example/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late final SignupBloc _signupBloc;

  void onPressed() {
    _signupBloc.add(
      SignupUserEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _signupBloc = context.read<SignupBloc>();

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
        if (state.status == SignupStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CreateAccountEmail(emailController: _emailController),
              const SizedBox(height: 30.0),
              _CreateAccountPassword(passwordController: _passwordController),
              const SizedBox(height: 30.0),
              _SubmitButton(onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreateAccountEmail extends StatelessWidget {
  _CreateAccountEmail({
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

class _CreateAccountPassword extends StatelessWidget {
  _CreateAccountPassword({
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

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Create Account'),
    );
  }
}
