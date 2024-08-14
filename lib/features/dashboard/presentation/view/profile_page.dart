import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc_boilerplate/features/auth/presentation/bloc/auth_event.dart';

import '../../../auth/presentation/bloc/auth_state.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(state.profile.avatar!)),
                      SizedBox(height: 16),
                      Text(
                        state.profile.name!,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 4),
                      Text(
                        state.profile.email!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            child: Text("Logout"),
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            },
                          ))
                        ],
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        )),
      ),
    );
  }
}
