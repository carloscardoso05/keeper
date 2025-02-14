import 'package:go_router/go_router.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/ui/items/item_details.dart';
import 'package:keeper/ui/items/items_page.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';
import 'package:keeper/ui/items/viewmodels/items/items_cubit.dart';
import 'package:keeper/ui/users/users_page.dart';
import 'package:keeper/ui/users/viewmodels/user_detail/user_detail_cubit.dart';
import 'package:keeper/ui/users/viewmodels/users/users_cubit.dart';
import 'package:keeper/ui/users/widgets/user_detail_page.dart';

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/users',
      builder: (context, state) => UsersPage(cubit: UsersCubit()),
    ),
    GoRoute(
      path: '/users/detail',
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetailPage(cubit: UserDetailCubit(user));
      },
    ),
    GoRoute(
      path: '/items',
      builder: (context, state) => ItemsPage(cubit: ItemsCubit()),
    ),
    GoRoute(
      path: '/items/detail',
      builder: (context, state) {
        final itemData = state.extra as ItemData;
        return ItemDetails(cubit: ItemDetailCubit(itemData));
      },
    ),
  ],
  initialLocation: '/users',
);
