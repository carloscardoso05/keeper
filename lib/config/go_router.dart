import 'package:go_router/go_router.dart';
import 'package:keeper/ui/items/items_page.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/users/users_page.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/users',
      builder: (context, state) => UsersPage(cubit: UsersCubit()),
    ),
    GoRoute(
      path: '/items',
      builder: (context, state) => ItemsPage(cubit: ItemsCubit()),
    ),
  ],
  initialLocation: '/users',
);
