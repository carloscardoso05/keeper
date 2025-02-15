import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  static const conjunctions = ['e', 'ou', 'de', 'da', 'do', 'das', 'dos'];

  String capitalize() {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String asName() {
    return split(
      r'\s+',
    ).map((e) => conjunctions.contains(e) ? e : e.capitalize()).join(' ');
  }

  String title() {
    return toLowerCase().split(' ').map((word) => word.capitalize()).join(' ');
  }

  String normalize() {
    return removeDiacritics(this);
  }
}
