import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/components/elements/form_input.dart';
import 'package:flutter_bloc_boilerplate/components/elements/label.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_bloc_boilerplate/utils/dialog_helper.dart';
import 'package:flutter_bloc_boilerplate/utils/validator_helper.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go("/dashboard");
        } else if (state is LoginFailed) {
          DialogHelper.showError(context, state.errorMessage);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 64,
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 64),
                    FormLabel(text: "Email"),
                    FormInput(
                      name: "email",
                      initialValue: "test@mail.com",
                      validator: ValidatorHelper.email(),
                    ),
                    SizedBox(height: 8),
                    FormLabel(text: "Password"),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return FormInput(
                          name: "password",
                          initialValue: "12345678",
                          isObscureText: state.isObscureText,
                          validator: ValidatorHelper.password(),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthToggleObscureText());
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: state.isObscureText
                                    ? Colors.black38
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
                                if (!(formKey.currentState!
                                    .saveAndValidate())) {
                                  return;
                                }

                                final formData = formKey.currentState!.value;

                                context.read<AuthBloc>().add(
                                      AuthLogin(
                                        email: formData["email"],
                                        password: formData["password"],
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
      ),
    );
  }
}
