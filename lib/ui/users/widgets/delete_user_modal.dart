import 'package:flutter/material.dart';

class DeleteUserModal extends StatelessWidget {
  const DeleteUserModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Deletar usuário'),
      content: Text('Tem certeza que deseja deletar este usuário?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Deletar'),
        ),
      ],
    );
  }
}
