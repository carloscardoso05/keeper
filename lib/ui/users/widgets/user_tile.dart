import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/config/routes.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: user.type.getIcon(),
      title: Text(user.name),
      onTap: () => context.push(Routes.userDetail, extra: user),
    );
  }
}
