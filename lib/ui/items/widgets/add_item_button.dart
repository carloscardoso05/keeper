import 'package:flutter/material.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/items/widgets/add_item_dialog.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key, required this.cubit});

  final ItemsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Adicionar item',
      onPressed: () async {
        final item = await showDialog<ItemDto>(
          context: context,
          builder: (context) => AddItemDialog(),
        );
        if (item != null) {
          cubit.saveItem(item);
        }
      },
      child: Icon(Icons.add),
    );
  }
}
