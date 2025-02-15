import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({
    super.key,
    required this.selectedTypes,
    required this.onSelected,
  });

  final Set<UserType> selectedTypes;
  final void Function(Set<UserType>) onSelected;

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final type in UserType.values)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChoiceChip(
                label: Text(type.getName()),
                selected: widget.selectedTypes.contains(type),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      widget.selectedTypes.add(type);
                    } else {
                      widget.selectedTypes.remove(type);
                    }
                  });
                  widget.onSelected(widget.selectedTypes);
                },
              ),
            ),
        ],
      ),
    );
  }
}
