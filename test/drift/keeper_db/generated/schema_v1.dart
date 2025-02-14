// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class UserTable extends Table with TableInfo<UserTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  UserTable createAlias(String alias) {
    return UserTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String name;
  final String type;
  const UserTableData(
      {required this.id, required this.name, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
    };
  }

  UserTableData copyWith({int? id, String? name, String? type}) =>
      UserTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
  })  : name = Value(name),
        type = Value(type);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? type}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class ItemTable extends Table with TableInfo<ItemTable, ItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ItemTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> assetCode = GeneratedColumn<String>(
      'asset_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const CustomExpression('\'\''));
  late final GeneratedColumn<int> holderId = GeneratedColumn<int>(
      'holder_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
  late final GeneratedColumn<String> properties = GeneratedColumn<String>(
      'properties', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, assetCode, name, description, holderId, properties];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      assetCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      holderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}holder_id']),
      properties: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}properties']),
    );
  }

  @override
  ItemTable createAlias(String alias) {
    return ItemTable(attachedDatabase, alias);
  }
}

class ItemTableData extends DataClass implements Insertable<ItemTableData> {
  final int id;
  final String assetCode;
  final String name;
  final String description;
  final int? holderId;
  final String? properties;
  const ItemTableData(
      {required this.id,
      required this.assetCode,
      required this.name,
      required this.description,
      this.holderId,
      this.properties});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['asset_code'] = Variable<String>(assetCode);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || holderId != null) {
      map['holder_id'] = Variable<int>(holderId);
    }
    if (!nullToAbsent || properties != null) {
      map['properties'] = Variable<String>(properties);
    }
    return map;
  }

  ItemTableCompanion toCompanion(bool nullToAbsent) {
    return ItemTableCompanion(
      id: Value(id),
      assetCode: Value(assetCode),
      name: Value(name),
      description: Value(description),
      holderId: holderId == null && nullToAbsent
          ? const Value.absent()
          : Value(holderId),
      properties: properties == null && nullToAbsent
          ? const Value.absent()
          : Value(properties),
    );
  }

  factory ItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemTableData(
      id: serializer.fromJson<int>(json['id']),
      assetCode: serializer.fromJson<String>(json['assetCode']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      holderId: serializer.fromJson<int?>(json['holderId']),
      properties: serializer.fromJson<String?>(json['properties']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'assetCode': serializer.toJson<String>(assetCode),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'holderId': serializer.toJson<int?>(holderId),
      'properties': serializer.toJson<String?>(properties),
    };
  }

  ItemTableData copyWith(
          {int? id,
          String? assetCode,
          String? name,
          String? description,
          Value<int?> holderId = const Value.absent(),
          Value<String?> properties = const Value.absent()}) =>
      ItemTableData(
        id: id ?? this.id,
        assetCode: assetCode ?? this.assetCode,
        name: name ?? this.name,
        description: description ?? this.description,
        holderId: holderId.present ? holderId.value : this.holderId,
        properties: properties.present ? properties.value : this.properties,
      );
  ItemTableData copyWithCompanion(ItemTableCompanion data) {
    return ItemTableData(
      id: data.id.present ? data.id.value : this.id,
      assetCode: data.assetCode.present ? data.assetCode.value : this.assetCode,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      holderId: data.holderId.present ? data.holderId.value : this.holderId,
      properties:
          data.properties.present ? data.properties.value : this.properties,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemTableData(')
          ..write('id: $id, ')
          ..write('assetCode: $assetCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('holderId: $holderId, ')
          ..write('properties: $properties')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, assetCode, name, description, holderId, properties);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemTableData &&
          other.id == this.id &&
          other.assetCode == this.assetCode &&
          other.name == this.name &&
          other.description == this.description &&
          other.holderId == this.holderId &&
          other.properties == this.properties);
}

class ItemTableCompanion extends UpdateCompanion<ItemTableData> {
  final Value<int> id;
  final Value<String> assetCode;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> holderId;
  final Value<String?> properties;
  const ItemTableCompanion({
    this.id = const Value.absent(),
    this.assetCode = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.holderId = const Value.absent(),
    this.properties = const Value.absent(),
  });
  ItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String assetCode,
    required String name,
    this.description = const Value.absent(),
    this.holderId = const Value.absent(),
    this.properties = const Value.absent(),
  })  : assetCode = Value(assetCode),
        name = Value(name);
  static Insertable<ItemTableData> custom({
    Expression<int>? id,
    Expression<String>? assetCode,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? holderId,
    Expression<String>? properties,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetCode != null) 'asset_code': assetCode,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (holderId != null) 'holder_id': holderId,
      if (properties != null) 'properties': properties,
    });
  }

  ItemTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? assetCode,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? holderId,
      Value<String?>? properties}) {
    return ItemTableCompanion(
      id: id ?? this.id,
      assetCode: assetCode ?? this.assetCode,
      name: name ?? this.name,
      description: description ?? this.description,
      holderId: holderId ?? this.holderId,
      properties: properties ?? this.properties,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (assetCode.present) {
      map['asset_code'] = Variable<String>(assetCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (holderId.present) {
      map['holder_id'] = Variable<int>(holderId.value);
    }
    if (properties.present) {
      map['properties'] = Variable<String>(properties.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTableCompanion(')
          ..write('id: $id, ')
          ..write('assetCode: $assetCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('holderId: $holderId, ')
          ..write('properties: $properties')
          ..write(')'))
        .toString();
  }
}

class ProjectTable extends Table
    with TableInfo<ProjectTable, ProjectTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProjectTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> responsibleId = GeneratedColumn<int>(
      'responsible_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, address, startDate, endDate, status, responsibleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      responsibleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}responsible_id'])!,
    );
  }

  @override
  ProjectTable createAlias(String alias) {
    return ProjectTable(attachedDatabase, alias);
  }
}

class ProjectTableData extends DataClass
    implements Insertable<ProjectTableData> {
  final int id;
  final String name;
  final String address;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final int responsibleId;
  const ProjectTableData(
      {required this.id,
      required this.name,
      required this.address,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.responsibleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['status'] = Variable<String>(status);
    map['responsible_id'] = Variable<int>(responsibleId);
    return map;
  }

  ProjectTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectTableCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      startDate: Value(startDate),
      endDate: Value(endDate),
      status: Value(status),
      responsibleId: Value(responsibleId),
    );
  }

  factory ProjectTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      status: serializer.fromJson<String>(json['status']),
      responsibleId: serializer.fromJson<int>(json['responsibleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'status': serializer.toJson<String>(status),
      'responsibleId': serializer.toJson<int>(responsibleId),
    };
  }

  ProjectTableData copyWith(
          {int? id,
          String? name,
          String? address,
          DateTime? startDate,
          DateTime? endDate,
          String? status,
          int? responsibleId}) =>
      ProjectTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        responsibleId: responsibleId ?? this.responsibleId,
      );
  ProjectTableData copyWithCompanion(ProjectTableCompanion data) {
    return ProjectTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      responsibleId: data.responsibleId.present
          ? data.responsibleId.value
          : this.responsibleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('responsibleId: $responsibleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, address, startDate, endDate, status, responsibleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.responsibleId == this.responsibleId);
}

class ProjectTableCompanion extends UpdateCompanion<ProjectTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> status;
  final Value<int> responsibleId;
  const ProjectTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.responsibleId = const Value.absent(),
  });
  ProjectTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required int responsibleId,
  })  : name = Value(name),
        address = Value(address),
        startDate = Value(startDate),
        endDate = Value(endDate),
        status = Value(status),
        responsibleId = Value(responsibleId);
  static Insertable<ProjectTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<int>? responsibleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (responsibleId != null) 'responsible_id': responsibleId,
    });
  }

  ProjectTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? address,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String>? status,
      Value<int>? responsibleId}) {
    return ProjectTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      responsibleId: responsibleId ?? this.responsibleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (responsibleId.present) {
      map['responsible_id'] = Variable<int>(responsibleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('responsibleId: $responsibleId')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final UserTable userTable = UserTable(this);
  late final ItemTable itemTable = ItemTable(this);
  late final ProjectTable projectTable = ProjectTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, itemTable, projectTable];
  @override
  int get schemaVersion => 1;
}
