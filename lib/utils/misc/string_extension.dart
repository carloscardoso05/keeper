import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String title() {
    return toLowerCase().split(' ').map((word) => word.capitalize()).join(' ');
  }

  String normalize() {
    return removeDiacritics(this);
  }
}
