import 'package:flutter/material.dart';
import 'package:keeper/domain/dtos/user_dto.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';
import 'package:keeper/ui/users/widgets/add_user_dialog.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({super.key, required this.cubit});

  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final user = await showDialog<UserDto>(
          context: context,
          builder: (context) => AddUserDialog(),
        );
        if (user != null) {
          cubit.saveUser(user);
        }
      },
      child: Icon(Icons.person_add),
    );
  }
}
