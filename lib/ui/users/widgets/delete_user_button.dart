import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/shared/delete_modal.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({super.key, required this.user, required this.cubit});

  final User user;
  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      backgroundColor: Colors.red,
      onPressed: (context) async {
        final delete = await showDialog<bool>(
          context: context,
          builder:
              (context) => DeleteModal(
                title: 'Apagar usuário',
                content: 'Deseja apagar o usuário "${user.name}?"',
              ),
        );
        if (delete == true) {
          cubit.deleteUser(user.id);
        }
      },
      icon: Icons.delete,
    );
  }
}
