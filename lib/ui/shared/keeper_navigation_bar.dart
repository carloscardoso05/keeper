import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KeeperNavigationBar extends StatelessWidget {
  const KeeperNavigationBar({super.key});

  final destinations = const <({NavigationDestination widget, String path})>[
    (
      widget: NavigationDestination(
        icon: Icon(Icons.people_alt_outlined),
        label: 'Usuários',
      ),
      path: '/users',
    ),
    (
      widget: NavigationDestination(
        icon: Icon(Icons.construction),
        label: 'Itens',
      ),
      path: '/items',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: destinations.map((d) => d.widget).toList(),
      onDestinationSelected: (i) => context.push(destinations[i].path),
    );
  }
}
