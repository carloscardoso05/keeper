import 'package:keeper/domain/entities/project.dart';

class ProjectDto {
  int? id;
  String name;
  String address;
  late DateTime startDate;
  late DateTime endDate;
  ProjectStatus status;
  int responsibleId;

  ProjectDto({
    this.id,
    this.name = '',
    this.address = '',
    DateTime? startDate,
    DateTime? endDate,
    this.status = ProjectStatus.paused,
    this.responsibleId = 0,
  }) {
    this.startDate = startDate ?? DateTime.now();
    this.endDate = endDate ?? DateTime.now();
  }
}
