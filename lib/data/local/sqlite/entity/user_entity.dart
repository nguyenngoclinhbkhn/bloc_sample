import 'package:sqflite/sqflite.dart';

enum TableUserConstant {
  table_name('user'),
  id('id'),
  user_name('user_name'),
  pass('pass');

  const TableUserConstant(this.rawValue);

  final String rawValue;
}

class UserEntity {
  int? id;
  String? userName;
  String? pass;

  UserEntity({this.id, this.userName, this.pass});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      TableUserConstant.id.rawValue: id,
      TableUserConstant.user_name.rawValue: userName,
      TableUserConstant.pass.rawValue: pass,
    };
    return map;
  }

  UserEntity.fromMap(Map<String, Object?> map) {
    id = map[TableUserConstant.id.rawValue] as int?;
    userName = map[TableUserConstant.user_name.rawValue] as String?;
    pass = map[TableUserConstant.pass.rawValue] as String?;
  }

  @override
  String toString() => 'id: $id -- user: $userName -- pass: $pass';
}

class SqlUserProvider {
  static Future<void> create(Database db) async {
    await db.execute('''
      create table "${TableUserConstant.table_name.rawValue}" (
        ${TableUserConstant.id.rawValue} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
        ${TableUserConstant.user_name.rawValue} TEXT NOT NULL,
        ${TableUserConstant.pass.rawValue} TEXT
          );
            ''');
  }

  static Future<void> insertUser({
    required Database db,
    required UserEntity user,
  }) async {
    await db.insert(TableUserConstant.table_name.rawValue, user.toMap());
  }

  static Future<List<UserEntity>> getAllData(Database db) async {
    final rawData = await db.query(TableUserConstant.table_name.rawValue);
    return rawData.map((e) => UserEntity.fromMap(e)).toList();
  }
}
