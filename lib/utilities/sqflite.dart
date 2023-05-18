import 'package:quiz_app/models/question.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  static DatabaseHelper get instance {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), 'quiz_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE questions(
            id INTEGER PRIMARY KEY,
            title TEXT,
            options TEXT,
            correct_answer INTEGER
          )
        ''');

        await db.execute('''
          INSERT INTO questions (id, title, options, correct_answer)
          VALUES 
          (1, 'What is Flutter?', '["A mobile development framework", "A database management system", "A programming Language", "An operating system"]', 0),
          (2, 'What Programming language is used in Flutter', '["Java", "Dart", "Swift", "Python"]', 1)
        ''');
      },
    );
  }

  Future<List<Question>> getQuestions() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('questions');

    return List.generate(
      maps.length,
      (index) => Question.fromMap(maps[index]),
    );
  }

  Future<void> insertQuestion(Question question) async {
    final Database db = await database;

    await db.insert(
      'questions',
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteQuestion(int id) async {
    final Database db = await database;

    await db.delete(
      'questions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
