import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/items/widgets/add_item_button.dart';
import 'package:keeper/ui/items/widgets/item_search_bar.dart';
import 'package:keeper/ui/items/widgets/items_list.dart';
import 'package:keeper/ui/shared/keeper_navigation_bar.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key, required this.cubit});
  final ItemsCubit cubit;

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  String searchValue = '';

  List<Item> filterItems(List<Item> items) {
    return items.where((item) {
      final name = item.name.toLowerCase();
      final assetCode = item.assetCode.toLowerCase();
      final description = item.description.toLowerCase();
      final search = searchValue.toLowerCase();
      return name.contains(search) ||
          assetCode.contains(search) ||
          description.contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Itens'), centerTitle: true),
      bottomNavigationBar: KeeperNavigationBar(),
      floatingActionButton: AddItemButton(cubit: widget.cubit),
      body: Center(
        child: BlocBuilder<ItemsCubit, ItemsState>(
          bloc: widget.cubit,
          builder:
              (context, state) => state.maybeWhen(
                orElse: () => CircularProgressIndicator(),
                loaded:
                    (result) => result.fold(
                      (data) {
                        final items = filterItems(data.items.values.toList());
                        return Column(
                          children: [
                            ItemSearchBar(
                              onChanged: (value) {
                                setState(() => searchValue = value);
                              },
                            ),
                            if (items.isEmpty) Text('Nenhum item encontrado'),
                            ItemsList(
                              items: items,
                              cubit: widget.cubit,
                              holders: data.holders,
                            ),
                          ],
                        );
                      },
                      (failure) => Text('Ocorreu um erro ao carregar os itens'),
                    ),
              ),
        ),
      ),
    );
  }
}
