import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
class Exhibit {
  final int id;
  final String name;
  final String imgLink;

  const Exhibit({
    required this.id,
    required this.name,
    required this.imgLink,
  });
}

Future initDB() async{
  WidgetsFlutterBinding.ensureInitialized();
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, "museum.db");
  final exist = await databaseExists(path);
  if (exist) {
    print("exists already");
  }
  else {
    print("copy from assets");
    try{
      await Directory(dirname(path)).create(recursive:true);
    }
    catch(_){}
    ByteData data = await rootBundle.load(join("lib","assets","museum.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush:true);
    print("db copied");
  }
  final db = await openDatabase(path);
  final List<Map<String, Object?>> exhibitsMaps = await db.query('tblExhibit', columns: ['id', 'name', 'imgLink']);
  print([
    for (final {
    'id': id as int,
    'name': name as String,
    'imgLink': imgLink as String,
    } in exhibitsMaps)
      Exhibit(id: id, name: name, imgLink: imgLink),
  ]);
}
void main(){
  initDB();
}