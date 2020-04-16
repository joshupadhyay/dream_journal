import 'package:dreamjournal/models/dreamentry.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';


class DBManager{

  Database _database;

    Future openDB () async {
      _database = await openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath() , 'dream_database.db') ,
        // When the database is first created, create a table to store
        onCreate: (Database db , version) async {
          await db.execute(
            "CREATE TABLE dreams(id INTEGER PRIMARY KEY, "
                "dreamtitle TEXT, dreamplace TEXT, dreamlocation TEXT ishappy INTEGER)" ,

            //INTEGER PRIMARY KEY will automatically autoincrement, as long as we pass null into id. That's that I've done
          );
        } ,
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1 ,
      );
    }

    Future<void> insertDream(DreamEntry newdream) async {
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

    Future<List<DreamEntry>> dreamList() async {
      // Get a reference to the database.
      final Database db = await _database;

      // Query the table for all The Dogs.
      final List<Map<String, dynamic>> maps = await db.query('dreams');

      // Convert the List<Map<String, dynamic> into a List<Dog>.
      return List.generate(maps.length, (i) {
        return DreamEntry(
          dreamLocation: maps[i]['dreamlocation'],
          dreamPeople: maps[i]['dreampeople'],
          dreamTitle: maps[i]['dreamtitle'],
          isHappy: maps[i]['ishappy']
        );
      });
    }


    Future<void> updateDream(DreamEntry dream) async {
      // Get a reference to the database.
      final db = await _database;

      // Update the given Dog.
      await db.update(
        'dreams',
        dream.toMap(),
        // Ensure that the Dog has a matching id.
        where: "dreamtitle = ?",

        ///USING DREAMTITLE INSTEAD OF DREAM_ID. when people click on the dream we'll hand the title.

        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [dream.dreamTitle],
      );
    }


    ///when delete method is

    Future<void> deleteDream(String selectedtitle) async {
      // Get a reference to the database.
      final db = await _database;

      // Remove the Dog from the database.
      await db.delete(
        'dreams',
        // Use a `where` clause to delete a specific dog.
        where: "dreamtitle = ?",
        // Pass the Dog's id as a whereArg to prevent SQL injection.
        whereArgs: [selectedtitle],
      );
    }

}

//TODO: These are the defined functions that we now need to implement, if we choose SQL

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



