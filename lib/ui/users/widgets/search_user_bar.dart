import 'package:flutter/material.dart';

class SearchUserBar extends StatelessWidget {
  const SearchUserBar({super.key, required this.onChanged});
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.9,
      child: SearchBar(
        leading: Icon(Icons.search),
        hintText: 'Busca pelo nome',
        elevation: WidgetStatePropertyAll(2),
        onChanged: onChanged,
      ),
    );
  }
}
