import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/viewmodels/transfer_item/transfer_item_cubit.dart';
import 'package:keeper/ui/items/widgets/transfer_item_dialog.dart';

class TransferItemButton extends StatelessWidget {
  const TransferItemButton({
    super.key,
    required this.item,
    required this.cubit,
  });

  final Item item;
  final ItemDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: Icon(Icons.move_up),
      label: Text('Transferir item'),
      iconAlignment: IconAlignment.end,
      onPressed: () async {
        final data = await showDialog<ItemData>(
          context: context,
          builder:
              (context) => TransferItemDialog(cubit: TransferItemCubit(item)),
        );
        if (data != null) {
          cubit.refresh(data);
        }
      },
    );
  }
}
