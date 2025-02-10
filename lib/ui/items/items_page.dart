import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/items/widgets/add_item_dialog.dart';
import 'package:keeper/ui/shared/delete_modal.dart';
import 'package:keeper/ui/shared/keeper_navigation_bar.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({
    super.key,
    required this.cubit,
  });
  final ItemsCubit cubit;

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  String searchValue = '';
  List<Item> filterItems(List<Item> items) {
    return items.where((item) {
      final name = item.name.toLowerCase();
      final search = searchValue.toLowerCase();
      return name.contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens'),
        centerTitle: true,
      ),
      bottomNavigationBar: KeeperNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await showDialog<ItemDto>(
            context: context,
            builder: (context) => AddItemDialog(),
          );
          if (item != null) {
            widget.cubit.saveItem(item);
          }
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<ItemsCubit, ItemsState>(
          bloc: widget.cubit,
          builder: (context, state) => switch (state) {
            Initial() || Loading() => CircularProgressIndicator(),
            Loaded() => state.result.fold(
                (success) {
                  final items = filterItems(success.values.toList());
                  return Column(
                    children: [
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: SearchBar(
                          leading: Icon(Icons.search),
                          hintText: 'Busca pelo nome',
                          elevation: WidgetStatePropertyAll(2),
                          onChanged: (value) => setState(() {
                            searchValue = value;
                          }),
                        ),
                      ),
                      if (items.isEmpty) Text('Nenhum item encontrado'),
                      ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = items[index];
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
                                      builder: (context) => DeleteModal(
                                        title: 'Apagar item',
                                        content:
                                            'Deseja apagar o item "${item.name}?"',
                                      ),
                                    );
                                    if (delete == true) {
                                      widget.cubit.deleteItem(item.id);
                                    }
                                  },
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(Icons.construction),
                              title: Text('${item.name} (${item.assetCode})'),
                              subtitle: Text(
                                item.description,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                (failure) => Text(failure.toString()),
              )
          },
        ),
      ),
    );
  }
}
