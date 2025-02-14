import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/domain/dtos/user_dto.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/shared/delete_modal.dart';
import 'package:keeper/ui/shared/keeper_navigation_bar.dart';
import 'package:keeper/ui/users/widgets/add_user_dialog.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';
import 'package:keeper/utils/domain/entities/user_extension.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key, required this.cubit});
  final UsersCubit cubit;

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String searchValue = '';
  Set<UserType> selectedTypes = {for (final type in UserType.values) type};
  List<User> filterUsers(List<User> users) {
    return users.where((user) {
      final name = user.name.toLowerCase();
      final search = searchValue.toLowerCase();
      return name.contains(search) && selectedTypes.contains(user.type);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários'), centerTitle: true),
      bottomNavigationBar: KeeperNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final user = await showDialog<UserDto>(
            context: context,
            builder: (context) => AddUserDialog(),
          );
          if (user != null) {
            widget.cubit.saveUser(user);
          }
        },
        child: Icon(Icons.person_add),
      ),
      body: Center(
        child: BlocBuilder<UsersCubit, UsersState>(
          bloc: widget.cubit,
          builder:
              (context, state) => switch (state) {
                Initial() || Loading() => CircularProgressIndicator(),
                Loaded() => state.result.fold((success) {
                  final users = filterUsers(success.values.toList());
                  return Column(
                    children: [
                      SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: SearchBar(
                          leading: Icon(Icons.search),
                          hintText: 'Busca pelo nome',
                          elevation: WidgetStatePropertyAll(2),
                          onChanged:
                              (value) => setState(() {
                                searchValue = value;
                              }),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (final type in UserType.values)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  label: Text(type.getName()),
                                  selected: selectedTypes.contains(type),
                                  onSelected:
                                      (selected) => setState(() {
                                        if (selected) {
                                          selectedTypes.add(type);
                                        } else {
                                          selectedTypes.remove(type);
                                        }
                                      }),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (users.isEmpty) Text('Nenhum usuário encontrado'),
                      ListView.builder(
                        itemCount: users.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Slidable(
                            endActionPane: ActionPane(
                              extentRatio: 0.2,
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  backgroundColor: Colors.red,
                                  onPressed: (context) async {
                                    final delete = await showDialog<bool>(
                                      context: context,
                                      builder:
                                          (context) => DeleteModal(
                                            title: 'Apagar usuário',
                                            content:
                                                'Deseja apagar o usuário "${user.name}?"',
                                          ),
                                    );
                                    if (delete == true) {
                                      widget.cubit.deleteUser(user.id);
                                    }
                                  },
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: user.type.getIcon(),
                              title: Text(user.name),
                              onTap:
                                  () => context.push(
                                    '/users/detail',
                                    extra: user,
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }, (failure) => Text(failure.toString())),
              },
        ),
      ),
    );
  }
}
