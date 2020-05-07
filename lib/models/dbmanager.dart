import 'package:dreamjournal/models/dreamentryclass.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:async/async.dart';

/// file for DBManager class that uses sqlLite imports to instantiate and
/// utilize local storage on the user's phone

class DBManager{
  static final DBManager _instance = DBManager._internal();
  DBManager._internal();

  static Database _database;
  final _openDBMemoizer = AsyncMemoizer<Database>();

  factory DBManager() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null){
      return _database;
    }
    _database = await _openDBMemoizer.runOnce(()  async {
      return await _openDB();
    });
    return _database;
  }

  /// function _openDB instantiates SQL database

  Future<Database> _openDB () async {
    return await openDatabase(
      // Set the path to the database.
      join(await getDatabasesPath() , 'dreamdatabase2.db') ,
      // When the database is first created, create a table to store
      onCreate: (Database db , version) async {
        await db.execute(
          "CREATE TABLE dreams(id INTEGER PRIMARY KEY, "
              "dreamtitle TEXT, dreamlocation TEXT, dreampeople TEXT,"
              "isHappy INTEGER, isAngry INTEGER, isEmbarassed INTEGER, isContemplative INTEGER, "
              "isSad INTEGER, isExcited INTEGER, isCool INTEGER, isScared INTEGER, date INTEGER)" ,

        );

      } ,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 5,
    );
  }

  /// when insertDream method is called, new DreamEntryClass object is passed
  /// in and added to database

  Future<void> insertDream(DreamEntryClass newdream) async {

    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dream into the correct table.
    await db.insert(
      'dreams',
      newdream.toMap(),
      //conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// returns a Future object of a list of DreamEntryClass objects

  Future <List<DreamEntryClass>> dreamList() async {

    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all dreams
    var sqlMap = await db.query('dreams', orderBy: "date DESC");
    
    if (sqlMap.isNotEmpty){
      return sqlMap.map((dream) => DreamEntryClass.fromMap(dream)).toList();
    }else{
      return [];
    }

  }

/// when updateDream is called, DreamEntryClass object is passed in and updated
  /// with the user input

  Future<void> updateDream(DreamEntryClass dream) async {

    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'dreams',
      dream.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",

      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dream.id],
    );
  }


  ///when delete method is called, dream at specified ID is removed from database

  Future<void> deleteDream(int id) async {

    // Get a reference to the database.
    final db = await database;

    // Remove the Dream from the database.
    await db.delete(
      'dreams',
      // Use a `where` clause to delete a specific dream.
      where: "id = ?",
      // Pass the dream's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
