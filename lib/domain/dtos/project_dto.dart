import 'package:keeper/domain/entities/project.dart';

class ProjectDto {
  int? id;
  String name;
  String address;
  late DateTime startDate;
  late DateTime endDate;
  ProjectStatus status;
  int responsibleId;
  late List<int> employeesIds;

  ProjectDto({
    this.id,
    this.name = '',
    this.address = '',
    DateTime? startDate,
    DateTime? endDate,
    this.status = ProjectStatus.paused,
    this.responsibleId = 0,
    List<int>? employeesIds,
  }) {
    this.startDate = startDate ?? DateTime.now();
    this.endDate = endDate ?? DateTime.now();
    this.employeesIds = employeesIds ?? [];
  }
}
