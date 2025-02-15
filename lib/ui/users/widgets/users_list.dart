import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/users/users_page.dart';
import 'package:keeper/ui/users/widgets/user_slidable_tile.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.users, required this.widget});

  final List<User> users;
  final UsersPage widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserSlidableTile(user: user, widget: widget);
      },
    );
  }
}
