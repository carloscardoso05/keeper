import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/ui/users/viewmodels/user_detail/user_detail_cubit.dart';
import 'package:keeper/ui/users/widgets/user_data_list.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.cubit});

  final UserDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        bloc: cubit,
        builder:
            (context, state) => state.when(
              loading: () => const CircularProgressIndicator(),
              error: (exception) => Text(exception.toString()),
              loaded: (data) => UserDataList(data: data),
            ),
      ),
    );
  }
}
