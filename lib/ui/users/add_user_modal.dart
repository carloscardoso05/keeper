import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/domain/validators/user_validator.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class AddUserModal extends StatelessWidget {
  AddUserModal({super.key});
  final user = ValueNotifier(User(
    id: 0,
    name: '',
    type: UserType.employee,
    itemsIds: [],
  ));

  final validator = UserValidator();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: user,
        builder: (context, _) {
          return AlertDialog(
            title: Text('Adicionar usuário'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onChanged: (value) =>
                      user.value = user.value.copyWith(name: value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validator.byField(user.value, 'name'),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButton(
                  icon: user.value.type.getIcon(),
                  items: [
                    for (final type in UserType.values)
                      DropdownMenuItem(
                        value: type,
                        child: Text(type.getName()),
                      ),
                  ],
                  value: user.value.type,
                  onChanged: (value) =>
                      user.value = user.value.copyWith(type: value!),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: validator.validate(user.value).isValid
                    ? () => Navigator.of(context).pop(user.value)
                    : null,
                child: Text('Adicionar'),
              ),
            ],
          );
        });
  }
}
