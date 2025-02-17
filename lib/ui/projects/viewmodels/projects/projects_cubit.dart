import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keeper/data/repositories/project/project_repository.dart';
import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:keeper/main.dart';
import 'package:result_dart/result_dart.dart';

part 'projects_state.dart';
part 'projects_cubit.freezed.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsState.loading()) {
    loadProjects();
  }

  final ProjectRepository _projectRepository = getIt.get();

  Future<void> loadProjects() async {
    emit(ProjectsState.loading());
    _projectRepository.getAll().fold(
      (projects) => emit(ProjectsState.loaded(projects)),
      (error) => emit(ProjectsState.error(error)),
    );
  }

  Future<void> addProject(ProjectDto projectDto) async {
    emit(ProjectsState.loading());
    _projectRepository
        .save(projectDto)
        .flatMap((_) => _projectRepository.getAll())
        .fold(
          (projects) => emit(ProjectsState.loaded(projects)),
          (error) => emit(ProjectsState.error(error)),
        );
  }
}
