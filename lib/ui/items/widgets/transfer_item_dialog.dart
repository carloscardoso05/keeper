import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/viewmodels/transfer_item/transfer_item_cubit.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

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
      title: const Text('Transferir item'),
      content: BlocBuilder<TransferItemCubit, TransferItemState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.when(
            loading: () => const CircularProgressIndicator(),
            error: (error) => Text(error.toString()),
            loaded: (data) {
              return SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Transferir item para:'),
                    const SizedBox(height: 10),
                    ListenableBuilder(
                      listenable: newHolder,
                      builder: (context, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<User>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Nenhum responsável'),
                                icon: newHolder.value?.type.getIcon(),
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
                ),
              );
            },
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Cancelar'),
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
