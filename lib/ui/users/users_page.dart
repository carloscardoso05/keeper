import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/shared/keeper_navigation_bar.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';
import 'package:keeper/ui/users/widgets/add_user_button.dart';
import 'package:keeper/ui/users/widgets/search_user_bar.dart';
import 'package:keeper/ui/users/widgets/select_user_type.dart';
import 'package:keeper/ui/users/widgets/users_list.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.cubit});
  final UsersCubit cubit;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String searchValue = '';
  Set<UserType> selectedTypes = {for (final type in UserType.values) type};
  List<User> filterUsers(List<User> users) {
    return users.where((user) {
      final name = user.name.toLowerCase();
      final search = searchValue.toLowerCase();
      return name.contains(search) && selectedTypes.contains(user.type);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários'), centerTitle: true),
      bottomNavigationBar: KeeperNavigationBar(),
      floatingActionButton: AddUserButton(cubit: widget.cubit),
      body: BlocBuilder<UsersCubit, UsersState>(
        bloc: widget.cubit,
        builder:
            (context, state) => switch (state) {
              Initial() || Loading() => CircularProgressIndicator(),
              Loaded() => state.result.fold((success) {
                final users = filterUsers(success.values.toList());
                return Column(
                  children: [
                    SearchUserBar(
                      onChanged: (value) => setState(() => searchValue = value),
                    ),
                    SelectUserType(
                      selectedTypes: selectedTypes,
                      onSelected:
                          (types) => setState(() => selectedTypes = types),
                    ),
                    if (users.isEmpty) Text('Nenhum usuário encontrado'),
                    UsersList(users: users, widget: widget),
                  ],
                );
              }, (failure) => Text(failure.toString())),
            },
      ),
    );
  }
}
