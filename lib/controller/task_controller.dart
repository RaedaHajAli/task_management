import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';


class TaskController extends GetxController {
  Database? _database;
  Database? get database => _database;
  List<Map> _allTasks = [];
  List<Map> get allTasks => _allTasks;
  void createDatabase() {
    openDatabase(
      'task.db',
      version: 1,
      onCreate: (db, version) {
        print('Database Created');

        //Create a new table 'Tasks'
        db
            .execute(
                'create table tasks (id integer primary key autoincrement,name text,detail text, time text)')
            .then((value) {
          print('Tasks table Created');
        }).catchError((error) {
          print(
              'When creating database an error happenened ${error.toString()}');
        });
      },
      onOpen: (db) {
        print('Database Opened');
        _database = db;
        getDataFromDatabase(db);
      },
    );
  }

  Future insertToDatabase(
      {required String name, required String detail, required String time}) {
    return _database!.transaction((txn) async {
      await txn.rawInsert(
          'insert into tasks (name, detail, time) values("$name","$detail","$time") ');
    }).then((value) {
      getDataFromDatabase(_database!);
      print('Successfull insert into Database');
      update();

      // getDataFromDatabase(database!);
    }).catchError((error) {
      print('Error happened when insert into Database ${error.toString()}');
    });
  }

  getDataFromDatabase(Database database) async {
    _allTasks = [];

    database.rawQuery('select * from tasks').then((value) {
      // print(tasks);
      value.forEach((element) {
        _allTasks.add(element);
        update();
      });
    }).catchError((e) {
      print('Error happened when getting data from database: ${e.toString()} ');
    });
  }

  Future updateData(
      {required String name, required String detail, required int id})  {
    return _database!.rawUpdate(
        'UPDATE tasks SET name = ? , detail =? WHERE id = ?',
        ['$name', '$detail', id]).then((value) {
      print('Update process is successful');
      update();
      getDataFromDatabase(_database!);
    }).catchError((e) {
      print('Error with updating the raw: ${e.toString()}');
    });
  }

Future  deleteFromDatabase({required int id}) {
 return   _database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      print('Delete process is successful');
      getDataFromDatabase(_database!);
    }).catchError((e) {
      print('Error when deleting the raw: ${e.toString()}');
    });
  }
}
