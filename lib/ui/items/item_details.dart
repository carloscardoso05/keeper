import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/viewmodels/transfer_item/transfer_item_cubit.dart';
import 'package:keeper/ui/items/widgets/transfer_item_dialog.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.cubit});

  final ItemDetailCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemDetailCubit, ItemDetailState>(
      bloc: cubit,
      builder:
          (context, state) => state.when(
            loading:
                () => Scaffold(
                  appBar: AppBar(title: Text('Item')),
                  body: Center(child: CircularProgressIndicator()),
                ),
            loaded:
                (result) => Scaffold(
                  appBar: AppBar(title: Text('Item')),
                  body: result.fold(
                    (success) {
                      final item = success.item;
                      final user = success.holder;
                      return Column(
                        children: [
                          Text('Item: ${item.name}'),
                          Text('Asset code: ${item.assetCode}'),
                          Text('Description: ${item.description}'),
                          Text('Owner: ${user?.name ?? 'No owner'}'),
                          FilledButton(
                            onPressed: () async {
                              final data = await showDialog<ItemData>(
                                context: context,
                                builder:
                                    (context) => TransferItemDialog(
                                      cubit: TransferItemCubit(item),
                                    ),
                              );
                              if (data != null) {
                                cubit.refresh(data);
                              }
                            },
                            child: Text('Transferir item'),
                          ),
                        ],
                      );
                    },
                    (failure) {
                      return Center(child: Text(failure.toString()));
                    },
                  ),
                ),
          ),
    );
  }
}
