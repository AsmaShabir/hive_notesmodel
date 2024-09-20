

import 'package:hive/hive.dart';
import 'package:hivedb/models/notesModel.dart';

class Boxes{
  static Box<notesModel> getData()=>Hive.box<notesModel>('notes');
}