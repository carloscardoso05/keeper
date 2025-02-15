import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/items/widgets/item_slidable_tile.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({
    super.key,
    required this.items,
    required this.cubit,
    required this.holders,
  });

  final List<Item> items;
  final Map<int, User> holders;
  final ItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        final holder = holders[item.holderId];
        return ItemSlidableTile(item: item, cubit: cubit, holder: holder);
      },
    );
  }
}
