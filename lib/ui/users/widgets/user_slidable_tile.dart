import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/users/users_page.dart';
import 'package:keeper/ui/users/widgets/delete_user_button.dart';
import 'package:keeper/ui/users/widgets/user_tile.dart';

class UserSlidableTile extends StatelessWidget {
  const UserSlidableTile({super.key, required this.user, required this.widget});

  final User user;
  final UsersPage widget;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [DeleteUserButton(user: user, cubit: widget.cubit)],
      ),
      child: UserTile(user: user),
    );
  }
}
