import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectStatus { running, paused, finished }

@freezed
class Project with _$Project {
  factory Project({
    required int id,
    required String name,
    required String address,
    required DateTime startDate,
    required DateTime endDate,
    required ProjectStatus status,
    required int responsibleId,
    @Default([]) List<int> employeesIds,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
