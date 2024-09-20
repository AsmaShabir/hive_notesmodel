// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notesModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notesModelAdapter extends TypeAdapter<notesModel> {
  @override
  final int typeId = 0;

  @override
  notesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notesModel(
      title: fields[0] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class photosModelAdapter extends TypeAdapter<photosModel> {
  @override
  final int typeId = 1;

  @override
  photosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return photosModel(
      albumId: fields[0] as int?,
      id: fields[1] as int?,
      title: fields[2] as String?,
      url: fields[3] as String?,
      thumbnailUrl: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, photosModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.albumId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is photosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
