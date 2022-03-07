import 'package:finallygod/Modals/childdb.dart';
import 'package:finallygod/Modals/vaccinedb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as d;

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();
  MyDatabase._init();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB('productcategory.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = d.join(dbPath, filepath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const realType = 'REAL NOT NULL';
    await db.execute('''CREATE TABLE $tableVaccineDB (
    ${VaccineDBField.vaccineDBID} $idType,
    ${VaccineDBField.vaccinename} $textType,
    ${VaccineDBField.isdone} $integerType,
    ${VaccineDBField.istimegone} $integerType,
    ${VaccineDBField.childID} $integerType,

    FOREIGN KEY(${VaccineDBField.childID}) REFERENCES $tableChildDB (${ChildDBField.childDBID})
   )''');
    await db.execute('''CREATE TABLE $tableChildDB (
    ${ChildDBField.childDBID} $idType,
    ${ChildDBField.name} $textType,
    ${ChildDBField.dob} $textType
   
   
   )''');
  }

  Future<VaccineDB> createvaccinedb(VaccineDB vaccineDB) async {
    final db = await instance.database;
    final id = await db!.insert(tableVaccineDB, vaccineDB.toJson());
    return vaccineDB.copy(id: id);
  }

  Future<ChildDB> createchilddb(ChildDB childDB) async {
    final db = await instance.database;
    final id = await db!.insert(tableChildDB, childDB.toJson());
    return childDB.copy(id: id);
  }

  Future<List<ChildDB>> readAllchildDB() async {
    final db = await instance.database;
    final result = await db!.query(tableChildDB);
    if(result.isNotEmpty){
    return result.map((json) => ChildDB.fromJson(json)).toList();
    }else{
      return [];
    }    
  }
  Future<List<VaccineDB>> readvaccine(int id) async {
    final db = await instance.database;
    final maps = await db!.rawQuery('SELECT * FROM $tableVaccineDB WHERE childID=?', [id]);
    if (maps.isNotEmpty) {
      return maps.map((element) =>VaccineDB.fromJson(element)).toList();
    } else {
      throw Exception('ID $id not found');
    }
    
  }
   Future deletevaccine(int id)async{
   final db= await instance.database;
   await db!.delete(tableVaccineDB,where: 'childID = ?',whereArgs: [id]);
     }
  Future deletechild(int id)async{
   final db= await instance.database;
   await db!.delete(tableChildDB,where: '_childDBID = ?',whereArgs: [id]);
     }

  Future updateposmasterpayment(int done, int id) async {
    final db = await instance.database;
    return db!.update(tableVaccineDB, {'isdone': done},
        where: '${VaccineDBField.vaccineDBID} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}
