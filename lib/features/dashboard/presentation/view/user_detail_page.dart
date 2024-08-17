import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/core/base_state.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/presentation/cubit/user_detail_cubit.dart';
import 'package:flutter_bloc_boilerplate/features/dashboard/presentation/cubit/user_detail_state.dart';
import 'package:flutter_bloc_boilerplate/utils/dialog_helper.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<UserDetailCubit, UserDetailState>(
            listener: (context, state) {
              if (state.status == Status.failure) {
                DialogHelper.showError(context, state.errorMessage!);
              }
            },
            builder: (context, state) {
              if (state.status == Status.success) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        CircleAvatar(
                            radius: 48,
                            backgroundImage: NetworkImage(state.data!.avatar!)),
                        SizedBox(height: 16),
                        Text(
                          state.data!.name!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 4),
                        Text(
                          state.data!.email!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
