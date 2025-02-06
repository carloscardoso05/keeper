import 'dart:convert';

import 'package:drift/drift.dart';

class JsonConverter extends TypeConverter<dynamic, String?> {
  const JsonConverter();

  @override
  dynamic fromSql(String? fromDb) {
    return jsonDecode(fromDb ?? '');
  }

  @override
  String toSql(dynamic value) {
    return jsonEncode(value);
  }
}
