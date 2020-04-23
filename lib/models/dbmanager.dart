import 'package:dreamjournal/models/dreamentryclass.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

//TODO: call openDB somewhere ONCE instead of inside each command!


//TODO: follow the tutorial again to match id, so instead of matching by dreamtitle, we match by id

class DBManager{

  Database _database;

    Future openDB () async {

      if (_database == null) {

        _database = await openDatabase(
          // Set the path to the database.
          join(await getDatabasesPath() , 'dreamdatabase.db') ,
          // When the database is first created, create a table to store
          onCreate: (Database db , version) async {
            await db.execute(
              "CREATE TABLE dreams(id INTEGER PRIMARY KEY, "
                  "dreamtitle TEXT, dreamplace TEXT, dreampeople TEXT,"
                  "dreamlocation TEXT, ishappy INTEGER, isangry INTEGER, iscontemplative INTEGER, "
                  "issad INTEGER, isexcited INTEGER, iscool INTEGER, isscared INTEGER)" ,

              ///if you add a new column, change the version of the database so it actually updates

            );

          } ,
          // Set the version. This executes the onCreate function and provides a
          // path to perform database upgrades and downgrades.
          version: 3,
        );
      }
    }

    Future<void> insertDream(DreamEntryClass newdream) async {

      await openDB();

      // Get a reference to the database.
      final Database db = await _database;

      // Insert the Dog into the correct table. Also specify the
      // `conflictAlgorithm`. In this case, if the same dog is inserted
      // multiple times, it replaces the previous data.
      await db.insert(
        'dreams',
        newdream.toMap(),
        //conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    Future <List<DreamEntryClass>> dreamList() async {
      await openDB();

      // Get a reference to the database.

      final Database db = await _database;

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('dreams');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return DreamEntryClass(
          dreamLocation: maps[i]['dreamlocation'],
          dreamPeople: maps[i]['dreampeople'],
          dreamTitle: maps[i]['dreamtitle'],
          isHappy: maps[i]['ishappy'],
          //TODO: need to add the additional emotions here once they are added to DreamEntryClass constructor
          id: maps[i]['id']
        );
      });
    }


    Future<void> updateDream(DreamEntryClass dream) async {

      await openDB();

      // Get a reference to the database.
      final db = await _database;

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


    ///when delete method is

    Future<void> deleteDream(int id) async {
      await openDB();

      // Get a reference to the database.
      final db = await _database;

      // Remove the Dream from the database.
      await db.delete(
        'dreams',
        // Use a `where` clause to delete a specific dog.
        where: "id = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [id],
      );
    }

//    Future<void> deleteAll() async{
//      await openDB();
//
//      final db = await _database;
//
//      db.rawDelete("Delete * from dreams");
//    }

}

///These are the database functions. Note how they're structured!

//void main() async {
//
//  // Insert a dog into the database.
//  await insertDog(fido);
//
//  // Print the list of dogs (only Fido for now).
//  print(await dogs());
//
//  // Update Fido's age and save it to the database.
//  fido = Dog(
//    id: fido.id,
//    name: fido.name,
//    age: fido.age + 7,
//  );
//  await updateDog(fido);
//
//  // Print Fido's updated information.
//  print(await dogs());
//
//  // Delete Fido from the database.
//  await deleteDog(fido.id);
//
//  // Print the list of dogs (empty).
//  print(await dogs());
//}



