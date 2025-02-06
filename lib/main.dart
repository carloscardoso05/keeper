import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:keeper/config/get_it.dart';
import 'package:keeper/keeper_app.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  runApp(const KeeperApp());
}

