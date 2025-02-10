import 'package:flutter/material.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    super.key,
    required this.title,
    this.content,
  });
  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content != null ? Text(content!) : null,
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
