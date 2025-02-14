import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/viewmodels/transfer_item/transfer_item_cubit.dart';

class TransferItemDialog extends StatefulWidget {
  const TransferItemDialog({super.key, required this.cubit});

  final TransferItemCubit cubit;

  @override
  State<TransferItemDialog> createState() => _TransferItemDialogState();
}

class _TransferItemDialogState extends State<TransferItemDialog> {
  User? newHolder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Transfer item'),
      content: BlocBuilder<TransferItemCubit, TransferItemState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.when(
            loading: () => const CircularProgressIndicator(),
            loaded:
                (data) {
                  final holder = data.employees[data.item.holderId];
                  return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Select employee to transfer item to:'),
                    DropdownButton<User>(
                      value: data.employees[data],
                      items: [
                        for (final employee in widget.employees.values)
                          DropdownMenuItem<User>(
                            value: employee,
                            child: Text(employee.name),
                          ),
                      ],
                      onChanged: (value) => setState(() => newHolder = value),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => setState(() => newHolder = null),
                    ),
                  ],
                );
                },
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(newHolder),
          child: const Text('Transferir'),
        ),
      ],
    );
  }
}
