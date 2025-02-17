import 'package:flutter/material.dart';
import 'package:keeper/domain/dtos/item_dto.dart';
import 'package:keeper/domain/validators/item_validator.dart';

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final item = ItemDto();

  final validator = ItemValidator();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            onChanged: (value) => setState(() => item.name = value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator.byField(item, 'name'),
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            onChanged: (value) => setState(() => item.assetCode = value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator.byField(item, 'assetCode'),
            decoration: InputDecoration(
              labelText: 'Código de patrimônio',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            onChanged: (value) => setState(() => item.description = value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: null,
            minLines: 4,
            validator: validator.byField(item, 'description'),
            decoration: InputDecoration(
              labelText: 'Descrição',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed:
              validator.validate(item).isValid
                  ? () => Navigator.of(context).pop(item)
                  : null,
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
