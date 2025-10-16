import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertTodo(String title) async {
    final dbClient = await db;
    return await dbClient.insert('todos', {'title': title});
  }

  static Future<List<Map<String, dynamic>>> getTodos() async {
    final dbClient = await db;
    return await dbClient.query('todos');
  }

  static Future<int> deleteTodo(int id) async {
    final dbClient = await db;
    return await dbClient.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
