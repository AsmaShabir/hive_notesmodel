

import 'package:hive/hive.dart';
part 'notesModel.g.dart';


@HiveType(typeId: 0)
class notesModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)

  String description;
  notesModel({required this.title,required this.description});
}

@HiveType(typeId: 1)
class photosModel extends HiveObject{
  @HiveField(0)
  int? albumId;
  @HiveField(1)

  int? id;
  @HiveField(2)

  String? title;
  @HiveField(3)

  String? url;
  @HiveField(4)

  String? thumbnailUrl;

  photosModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  photosModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}