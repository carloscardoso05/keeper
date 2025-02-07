import 'package:flutter/material.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:material_symbols_icons/symbols.dart';

extension UserTypeExtension on UserType {
  Icon getIcon() {
    switch (this) {
      case UserType.employee:
        return Icon(Symbols.person_apron, fill: 1);
      case UserType.manager:
        return Icon(Icons.engineering);
      case UserType.admin:
        return Icon(Symbols.shield_person, fill: 1);
    }
  }

  String getName() {
    switch (this) {
      case UserType.employee:
        return 'Funcionário';
      case UserType.manager:
        return 'Operador';
      case UserType.admin:
        return 'Admin';
    }
  }
}
