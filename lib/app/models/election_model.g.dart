// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElectionAdapter extends TypeAdapter<Election> {
  @override
  final int typeId = 0;

  @override
  Election read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Election(
      sampana: fields[0] as String,
      nombreDeVoteBlanc: fields[1] as int,
      nombreDeVoteInvalide: fields[2] as int,
      date: fields[3] as DateTime,
      etat: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Election obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sampana)
      ..writeByte(1)
      ..write(obj.nombreDeVoteBlanc)
      ..writeByte(2)
      ..write(obj.nombreDeVoteInvalide)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.etat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
