import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:lucid_validation/lucid_validation.dart';

class ProjectDtoValidator extends LucidValidator<ProjectDto> {
  ProjectDtoValidator() {
    ruleFor((item) => item.name.trim(), key: 'name')
        .notEmpty(message: 'O nome do projeto não pode ser vazio')
        .minLength(
          2,
          message: 'O nome do projeto deve ter no mínimo 2 caracteres',
        );
  }
}
