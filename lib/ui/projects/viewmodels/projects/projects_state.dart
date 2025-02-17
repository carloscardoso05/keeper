part of 'projects_cubit.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.loading() = _Loading;
  const factory ProjectsState.loaded(Map<int, Project> projects) = _Loaded;
  const factory ProjectsState.error(Exception error) = _Error;
}
