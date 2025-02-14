import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/config/go_router.dart';
import 'package:keeper/config/routes.dart';

class KeeperNavigationBar extends StatefulWidget {
  const KeeperNavigationBar({super.key});

  @override
  State<KeeperNavigationBar> createState() => _KeeperNavigationBarState();
}

class _KeeperNavigationBarState extends State<KeeperNavigationBar> {
  final destinations = const <({NavigationDestination widget, String path})>[
    (
      widget: NavigationDestination(
        icon: Icon(Icons.people_alt_outlined),
        label: 'Usuários',
      ),
      path: Routes.users,
    ),
    (
      widget: NavigationDestination(
        icon: Icon(Icons.construction),
        label: 'Itens',
      ),
      path: Routes.items,
    ),
  ];

  late int index;

  @override
  void initState() {
    super.initState();

    index = destinations.indexWhere((d) => d.path == goRouter.state.path);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      destinations: destinations.map((d) => d.widget).toList(),
      onDestinationSelected: (i) => context.push(destinations[i].path),
    );
  }
}
