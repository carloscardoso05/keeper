import 'package:keeper/data/repositories/project/project_repository.dart';
import 'package:keeper/data/services/project/drift_project_service.dart';
import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:result_dart/result_dart.dart';

class DriftProjectRepository implements ProjectRepository {
  final DriftProjectService _service;

  const DriftProjectRepository(this._service);

  @override
  AsyncResult<Project> delete(int id) {
    return _service.delete(id);
  }

  @override
  AsyncResult<Project> get(int id) {
    return _service.get(id);
  }

  @override
  AsyncResult<Map<int, Project>> getAll() {
    return _service.getAll();
  }

  @override
  AsyncResult<Project> save(ProjectDto value, [int? id]) {
    return _service.save(toModel(value), id);
  }

  @override
  ProjectDto toDto(Project model) {
    return ProjectDto(
      id: model.id,
      name: model.name,
      address: model.address,
      startDate: model.startDate,
      endDate: model.endDate,
      responsibleId: model.responsibleId,
      status: model.status,
    );
  }

  @override
  Project toModel(ProjectDto dto) {
    return Project(
      id: dto.id ?? 0,
      name: dto.name,
      address: dto.address,
      startDate: dto.startDate,
      endDate: dto.endDate,
      responsibleId: dto.responsibleId,
      status: dto.status,
    );
  }
}
