import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keeper/config/go_router.dart';

class KeeperApp extends StatelessWidget {
  const KeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: goRouter,
      title: 'Keeper',
      debugShowCheckedModeBanner: false,
    );
  }
}
