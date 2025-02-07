import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/ui/users/viewmodels/users_cubit.dart';

class UsersLayout extends StatelessWidget {
  const UsersLayout({super.key, required this.cubit});
  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<UsersCubit, UsersState>(
          bloc: cubit,
          builder: (context, state) => switch (state) {
            Initial() || Loading() => CircularProgressIndicator(),
            Loaded() => state.result.fold(
                (success) => ListView.builder(
                  itemCount: success.length,
                  itemBuilder: (context, index) {
                    final user = success[index]!;
                    return ListTile(
                      title: Text(user.name),
                    );
                  },
                ),
                (failure) => Text(failure.toString()),
              )
          },
        ),
      ),
    );
  }
}
