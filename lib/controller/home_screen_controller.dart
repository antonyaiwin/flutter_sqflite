import 'dart:developer';

import 'package:flutter_sqflite/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database database;
  static List<StudentModel> studentsList = [];

  static Future<void> initDB() async {
    // open the database
    database = await openDatabase('demo.db', version: 2,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, phoneNumber INTEGER)');
    });
  }

// add data to database table
  static Future<void> addData() async {
    await database.rawInsert(
        'INSERT INTO Student(name, phoneNumber) VALUES(?, ?)',
        ['aiwin', 1234567890]);
    await getAllData();
  }

  // get all data from table
  static Future<void> getAllData() async {
    var data = await database.rawQuery('SELECT * FROM Student');
    studentsList = data.map((e) => StudentModel.fromMap(e)).toList();
    log(data.toString());
  }

  // delete data from table
  static Future<void> deleteData(var id) async {
    await database.rawDelete('DELETE FROM Student WHERE id = ?', [id]);
    await getAllData();
  }

  // delete data from table
  static Future<void> editData(var id) async {
    int count = await database.rawUpdate(
        'UPDATE Student SET name = ?, phoneNumber = ? WHERE id = ?',
        ['updated name', '9876', id]);
    log('updated: $count');
    await getAllData();
  }
}
