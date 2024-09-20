import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivedb/homeScreen.dart';
import 'package:hivedb/models/notesModel.dart';

import 'package:hivedb/photos%20api/photoScreen.dart';
import 'package:path_provider/path_provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory= await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(photosModelAdapter());
   await Hive.openBox<photosModel>('photo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:hiveDb(),
    );
  }
}

