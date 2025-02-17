import 'package:flutter/material.dart';
import 'package:keeper/domain/dtos/user_dto.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/domain/validators/user_validator.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key});

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final user = UserDto();

  final validator = UserValidator();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar usuário'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            onChanged: (value) => setState(() => user.name = value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator.byField(user, 'name'),
            decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'Tipo',
              border: OutlineInputBorder(),
            ),
            icon: user.type.getIcon(),
            items: [
              for (final type in UserType.values)
                DropdownMenuItem(value: type, child: Text(type.getName())),
            ],
            value: user.type,
            onChanged: (value) => setState(() => user.type = value!),
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
              validator.validate(user).isValid
                  ? () => Navigator.of(context).pop(user)
                  : null,
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
