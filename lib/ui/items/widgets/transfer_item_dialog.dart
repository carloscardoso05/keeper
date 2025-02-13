import 'package:flutter/material.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/main.dart';
import 'package:keeper/ui/items/viewmodels/item_detail/item_detail_cubit.dart';

class TransferItemDialog extends StatelessWidget {
  TransferItemDialog({super.key, required this.itemData});

  final ItemData itemData;
  final UserRepository _userRepository = getIt.get();

  @override
  Widget build(BuildContext context) {
    return AlertDialog();
  }
}
