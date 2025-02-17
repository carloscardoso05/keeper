import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/widgets/transfer_item_button.dart';
import 'package:material_symbols_icons/symbols.dart';

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
                (result) => result.fold(
                  (success) {
                    final item = success.item;
                    final user = success.holder;
                    return Scaffold(
                      appBar: AppBar(
                        actions: [
                          IconButton(
                            icon: Icon(Symbols.edit_square),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 10),
                              Text('Código: ${item.assetCode}'),
                              if (user != null) Text('Sem responsável'),
                              if (user == null)
                                Text('Responsável: ${user!.name}'),
                              Text('Descrição: ${item.description}'),
                              Spacer(),
                              TransferItemButton(item: item, cubit: cubit),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  (failure) {
                    return Center(child: Text(failure.toString()));
                  },
                ),
          ),
    );
  }
}
