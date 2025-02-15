import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/config/routes.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item, required this.holder});

  final Item item;
  final User? holder;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.construction),
      title: Text(item.name),
      isThreeLine: true,
      onTap:
          () => context.push(
            Routes.itemDetail,
            extra: (holder: holder, item: item),
          ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.assetCode, overflow: TextOverflow.ellipsis),
          Text(
            holder?.name ?? 'Sem responsável',
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
