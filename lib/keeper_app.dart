import 'package:flutter/material.dart';
import 'package:keeper/config/go_router.dart';

class KeeperApp extends StatelessWidget {
  const KeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Keeper',
    );
  }
}
