import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/items/widgets/item_tile.dart';
import 'package:keeper/ui/shared/delete_modal.dart';

class ItemSlidableTile extends StatelessWidget {
  const ItemSlidableTile({
    super.key,
    required this.item,
    required this.cubit,
    required this.holder,
  });

  final Item item;
  final ItemsCubit cubit;
  final User? holder;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (context) async {
              final delete = await showDialog<bool>(
                context: context,
                builder:
                    (context) => DeleteModal(
                      title: 'Apagar item',
                      content: 'Deseja apagar o item "${item.name}"?',
                    ),
              );
              if (delete == true) {
                cubit.deleteItem(item.id);
              }
            },
            icon: Icons.delete,
          ),
        ],
      ),
      child: ItemTile(item: item, holder: holder),
    );
  }
}
