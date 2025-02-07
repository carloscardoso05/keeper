import 'package:go_router/go_router.dart';
import 'package:keeper/ui/users/users_layout.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';

final GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    path: '/users',
    builder: (context, state) => UsersLayout(cubit: UsersCubit()),
  ),
], initialLocation: '/users');
