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
      nom: fields[0] as String,
      photoDeProfil: fields[1] as Uint8List,
      nombreDeVoie: fields[2] as int,
      election: fields[3] as Election,
    );
  }

  @override
  void write(BinaryWriter writer, Candidat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nom)
      ..writeByte(1)
      ..write(obj.photoDeProfil)
      ..writeByte(2)
      ..write(obj.nombreDeVoie)
      ..writeByte(3)
      ..write(obj.election);
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
