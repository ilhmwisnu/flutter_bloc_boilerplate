import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/components/elements/form.dart';
import 'package:flutter_bloc_boilerplate/components/elements/label.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_event.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go("/dashboard");
        } else if (state is LoginFailed) {
          debugPrint(state.error.toString());
          //TODO : show error
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                  FormLabel(text: "Email"),
                  FormInput(name: "email"),
                  SizedBox(height: 8),
                  FormLabel(text: "Password"),
                  FormInput(name: "password"),
                  SizedBox(height: 16),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () async {
                              context.read<AuthBloc>().add(
                                    AuthLogin(
                                      email: 'mail@mail.com',
                                      password: "123123123",
                                    ),
                                  );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ))
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
