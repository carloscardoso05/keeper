import 'package:flutter/material.dart';
import 'package:keeper/ui/users/viewmodels/user_detail/user_detail_cubit.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class UserDataList extends StatelessWidget {
  const UserDataList({super.key, required this.data});

  final UserData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${data.user.name}'),
        Text('Tipo: ${data.user.type.getName()}'),
        Text('Itens'),
        for (final item in data.items.values) Text(item.name),
      ],
    );
  }
}
