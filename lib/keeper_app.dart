import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'keeper_app.route.dart';

part 'keeper_app.g.dart';

@Main('lib/ui')
class KeeperApp extends StatelessWidget {
  const KeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.users,
      ),
    );
  }
}
