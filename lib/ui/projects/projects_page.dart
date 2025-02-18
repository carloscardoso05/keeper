import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:keeper/domain/dtos/project_dto.dart';
import 'package:keeper/ui/projects/viewmodels/projects/projects_cubit.dart';
import 'package:keeper/ui/projects/widgets/add_project_dialog.dart';
import 'package:keeper/ui/shared/keeper_navigation_bar.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key, required this.cubit});

  final ProjectsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projetos'), centerTitle: true),
      bottomNavigationBar: KeeperNavigationBar(),
      body: BlocBuilder<ProjectsCubit, ProjectsState>(
        bloc: cubit,
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded:
                (projects) => ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final dateFormat = DateFormat('dd/MM/yy');
                    final project = projects.values.elementAt(index);
                    final start = dateFormat.format(project.startDate);
                    final end = dateFormat.format(project.endDate);
                    return ListTile(
                      leading: Icon(Icons.apartment),
                      title: Text(project.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(project.address),
                          Text('$start - $end'),
                        ],
                      ),
                    );
                  },
                ),
            error: (error) => Center(child: Text(error.toString())),
          );
        },
      ),
      floatingActionButton: AddProjectButton(cubit: cubit),
    );
  }
}

class AddProjectButton extends StatelessWidget {
  const AddProjectButton({super.key, required this.cubit});

  final ProjectsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final projectDto = await showDialog<ProjectDto?>(
          context: context,
          builder: (context) => AddProjectDialog(),
        );

        if (projectDto != null) cubit.addProject(projectDto);
      },
      child: Icon(Icons.domain_add),
    );
  }
}
