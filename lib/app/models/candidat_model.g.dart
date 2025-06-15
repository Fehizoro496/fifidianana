// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CandidatAdapter extends TypeAdapter<Candidat> {
  @override
  final int typeId = 1;

  @override
  Candidat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Candidat(
      numero: fields[0] as int,
      nom: fields[1] as String,
      pseudo: fields[2] as String,
      nombreDeVoie: fields[3] as int,
      election: fields[4] as Election,
      poste: fields[5] as String,
      colorFactor: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Candidat obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.numero)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.pseudo)
      ..writeByte(3)
      ..write(obj.nombreDeVoie)
      ..writeByte(4)
      ..write(obj.election)
      ..writeByte(5)
      ..write(obj.poste)
      ..writeByte(6)
      ..write(obj.colorFactor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CandidatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
