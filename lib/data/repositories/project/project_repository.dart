import 'package:keeper/data/repositories/base_repository.dart';
import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:keeper/domain/entities/project.dart';

abstract interface class ProjectRepository implements BaseRepository<Project, ProjectDto> {}