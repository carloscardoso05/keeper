import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:keeper/domain/validators/project_dto_validator.dart';

class AddProjectDialog extends StatefulWidget {
  AddProjectDialog({super.key});

  final dateController = TextEditingController(
    text: 'Nenhuma data selecionada',
  );

  @override
  State<AddProjectDialog> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  final ProjectDto projectDto = ProjectDto();

  final ProjectDtoValidator validator = ProjectDtoValidator();

  Future<void> selectDate(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.start.toString();
        projectDto.startDate = picked.start;
        projectDto.endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar projeto'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => setState(() => projectDto.name = value),
            validator: validator.byField(projectDto, 'name'),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Endereço',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => setState(() => projectDto.address = value),
            validator: validator.byField(projectDto, 'address'),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: widget.dateController,
            decoration: const InputDecoration(
              labelText: 'Data de início',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_month),
            ),
            maxLines: null,
            showCursor: false,
            mouseCursor: MouseCursor.uncontrolled,
            enableInteractiveSelection: false,
            readOnly: true,
            onTap: () => selectDate(context),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed:
              validator.validate(projectDto).isValid
                  ? () => context.pop(projectDto)
                  : null,
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
