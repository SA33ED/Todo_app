// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/models/task_model.dart';

class SqfLiteHelper {
  late Database db;

//! init DataBase
  initDB() async {
    //Create DATABASE
    await openDatabase(
      "tasks.db",
      version: 1,
      onCreate: (Database db, int version) async {
        //Create Table
        await db.execute('''
                 CREATE TABLE Tasks(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  title TEXT,
                  note TEXT,
                  date TEXT,
                  startTime TEXT,
                  endTime TEXT,
                  color INTEGER,
                  complete TEXT )
                ''').then((value) => print("DATABASE CREATED"));
      },
      onOpen: (db) => print('DATABASE OPENED'),
    ).then((value) => db = value).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

//! get
  Future<List<Map<String, Object?>>> getFromDB() async {
    return await db.rawQuery("SELECT * FROM Tasks");
  }

//! insert
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''
         INSERT INTO Tasks(title, note, date, startTime, endTime, color, complete)
         VALUES ('${model.title}','${model.note}','${model.date.toString()}','${model.startTime}','${model.endTime}',${model.color},'${model.status}')
        ''');
  }

//!Update
  Future<int> updateTaskStatusToCompeletedDB(int id) async {
    return await db.rawUpdate(
        ''' UPDATE Tasks SET complete = ? WHERE id = ? ''', ["COMPLETED", id]);
  }

//!Update
  Future<int> updateTaskStatusToUnCompeleted(int id) async {
    return await db.rawUpdate(
        ''' UPDATE Tasks SET complete = ? WHERE id = ? ''', ["TODO", id]);
  }

//!Delete
  Future<int> deleteTaskFormDB(int id) async {
    return await db.rawUpdate(''' DELETE FROM Tasks WHERE id = ? ''', [id]);
  }
}
