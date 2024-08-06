import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/base_state.dart';
import 'cubit/users_cubit.dart';
import 'cubit/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: BlocConsumer<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state.status == Status.initial) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: state.data?.length ?? 0,
              itemBuilder: (context, index) {
                final user = state.data![index];
                return ListTile(
                  onTap: () {
                    context.push("/users/123");
                  },
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(user.avatar!),
                  ),
                  title: Text(user.name!),
                  subtitle: Text(user.email!),
                );
              },
            );
          },
          listener: (BuildContext context, UsersState state) {
            if (state.status == Status.failure) {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                    child: Center(
                  child: Text("Error Bouss"),
                )),
              );
            }
          },
        ),
      ),
    );
  }
}
