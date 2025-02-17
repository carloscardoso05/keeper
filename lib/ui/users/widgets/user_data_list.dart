import 'package:flutter/material.dart';
import 'package:keeper/ui/users/viewmodels/user_detail/user_detail_cubit.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class UserDataList extends StatelessWidget {
  const UserDataList({super.key, required this.data});

  final UserData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.user.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (data.user.projectId == null)
            Text('Não alocado para nenhum projeto'),
          if (data.user.projectId != null)
            Text('Alocado para o projeto: ${data.user.projectId}'),
          Text('Tipo: ${data.user.type.getName()}'),
          if (data.items.values.isNotEmpty) ...[
            Text('Possui os seguintes itens'),
            for (final item in data.items.values) Text('·  ${item.name}'),
          ],
        ],
      ),
    );
  }
}
