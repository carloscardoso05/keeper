import 'package:keeper/domain/entities/user.dart';
import 'package:lucid_validation/lucid_validation.dart';

class UserValidator extends LucidValidator<User> {
  UserValidator() {
    ruleFor((user) => user.name.trim(), key: 'name')
        .must(
          (name) => RegExp(r'\d').allMatches(name).isEmpty,
          'O nome só deve conter letras',
          '',
        )
        .notEmpty(message: 'O nome não pode ser vazio')
        .minLength(2, message: 'O nome deve ter no mínimo 2 caracteres');
  }
}
