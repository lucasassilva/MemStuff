import 'package:memstuff/core/app_const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/stuff_model.dart';
import 'stuff_repository.dart';

class StuffRepositoryImpl implements StuffRepository {
  Future<Database> _getDatabase() async {
    final path = join(await getDatabasesPath(), kDatabaseName);
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(kCreateTableStuffSql);
      },
      version: kDatabaseVersion,
    );
  }

  @override
  Future create(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDatabase();
      await db.insert(
        kStuffTableName,
        stuff.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (error) {
      print('[CREATE] $error');
    } finally {
      db?.close();
    }
  }

  @override
  Future delete(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDatabase();
      await db.delete(
        kStuffTableName,
        where: 'id = ?',
        whereArgs: [stuff.id],
      );
    } catch (error) {
      print('[DELETE] $error');
    } finally {
      db?.close();
    }
  }

  @override
  Future update(StuffModel stuff) async {
    Database db;
    try {
      db = await _getDatabase();
      await db.update(
        kStuffTableName,
        stuff.toMap(),
        where: 'id = ?',
        whereArgs: [stuff.id],
      );
    } catch (error) {
      print('[UPDATE] $error');
    } finally {
      db?.close();
    }
  }

  @override
  Future<List<StuffModel>> readAll() async {
    Database db;
    try {
      db = await _getDatabase();
      final data = await db.query(kStuffTableName);
      return List.generate(
        data.length,
        (index) => StuffModel.fromMap(data[index]),
      );
    } catch (error) {
      print('[READ ALL] $error');
      return <StuffModel>[];
    } finally {
      db?.close();
    }
  }

  @override
  Future<StuffModel> readById(int id) async {
    Database db;
    try {
      db = await _getDatabase();
      final data = await db.query(
        kStuffTableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      return StuffModel.fromMap(data[0]);
    } catch (error) {
      print('[READ BY ID $id] $error');
      return null;
    } finally {
      db?.close();
    }
  }
}
