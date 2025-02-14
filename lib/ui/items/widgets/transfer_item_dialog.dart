import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/viewmodels/transfer_item/transfer_item_cubit.dart';

class TransferItemDialog extends StatefulWidget {
  const TransferItemDialog({super.key, required this.cubit});

  final TransferItemCubit cubit;

  @override
  State<TransferItemDialog> createState() => _TransferItemDialogState();
}

class _TransferItemDialogState extends State<TransferItemDialog> {
  final ValueNotifier<User?> newHolder = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    initNewHolder();
  }

  void initNewHolder() {
    widget.cubit.stream.listen((state) {
      state.whenOrNull(
        loaded: (data) {
          newHolder.value = data.employees[data.item.holderId];
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Transfer item'),
      content: BlocBuilder<TransferItemCubit, TransferItemState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.when(
            loading: () => const CircularProgressIndicator(),
            error: (error) => Text(error.toString()),
            loaded: (data) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Select employee to transfer item to:'),
                  ListenableBuilder(
                    listenable: newHolder,
                    builder: (context, _) {
                      return Row(
                        children: [
                          DropdownButton<User>(
                            value: newHolder.value,
                            items: [
                              for (final employee in data.employees.values)
                                DropdownMenuItem<User>(
                                  value: employee,
                                  child: Text(employee.name),
                                ),
                            ],
                            onChanged: (value) => newHolder.value = value,
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => newHolder.value = null,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () async {
            await widget.cubit.transferItem(newHolder.value);
            if (!context.mounted) return;
            Navigator.of(
              context,
            ).pop<ItemData>((holder: newHolder.value, item: widget.cubit.item));
          },
          child: const Text('Transferir'),
        ),
      ],
    );
  }
}
