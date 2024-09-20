
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivedb/models/notesModel.dart';

import 'boxes/box.dart';

class hiveDb extends StatefulWidget {
  const hiveDb({super.key});

  @override
  State<hiveDb> createState() => _hiveDbState();
}

class _hiveDbState extends State<hiveDb> {
  final titleController =TextEditingController();
  final descController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database'),
      ),
      body:ValueListenableBuilder(
          valueListenable: Boxes.getData().listenable(),
          builder: (context,box,_){
            var data=box.values.toList().cast<notesModel>();
            return ListView.builder(
              itemCount: box.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(data[index].title.toString()),
                            Spacer(),
                            Text(data[index].description.toString()),
                            InkWell(
                              onTap: (){
                               editDialogue(data[index],data[index].title.toString() , data[index].description.toString());
                              },
                                child: Icon(Icons.edit)),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                 delete(data[index]);
                              },
                                child: Icon(Icons.delete,color: Colors.red,)),
                          ],
                        ),


                      ],
                    ),
                  );
                }
            );
          }
      ),
      // body: Column(
      //   children: [
      //
      //     // FutureBuilder(future: Hive.openBox('asma'),
      //     //     builder: (context,snapshot){
      //     //   return Text(snapshot.data!.get('name').toString());
      //     //     }
      //     //
      //     // )
      //   ],

      floatingActionButton: FloatingActionButton(onPressed: () async{
        // var box= await Hive.openBox('asma');
        // box.put('name', 'asma shabbir');
        // print(box.get('name'));
          showMyDialogue();
      },
      child: Icon(Icons.add),
      ),
    );
  }
  void delete(notesModel notesModel )async{
   await notesModel.delete();
  }
  Future<void> editDialogue(notesModel,String title,String description)async{
    titleController.text=title;
    descController.text=description;
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Edit notes'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: descController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('cancel'),
              ),
              TextButton(onPressed: (){
               notesModel.title=titleController.text.toString();
               notesModel.description=descController.text.toString();

               notesModel.save();
              },
                child: Text('Edit'),
              )
            ],
          );
        }
    );
  }
  Future<void> showMyDialogue()async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('add notes'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: descController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                child: Text('cancel'),
              ),
              TextButton(onPressed: (){
                final data=notesModel(title: titleController.text, description: descController.text);
                final box =Boxes.getData();
                box.add(data);
                data.save();
                titleController.clear();
                descController.clear();
              },
                child: Text('add'),
              )
            ],
          );
        }
    );
  }
}
