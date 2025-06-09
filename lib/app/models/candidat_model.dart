import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'election_model.dart';

part 'candidat_model.g.dart';

@HiveType(typeId: 1)
class Candidat extends HiveObject {
  @HiveField(0)
  String nom;

  @HiveField(1)
  Uint8List photoDeProfil;

  @HiveField(2)
  int nombreDeVoie;

  @HiveField(3)
  Election election;

  Candidat({
    required this.nom,
    required this.photoDeProfil,
    this.nombreDeVoie = 0,
    required this.election,
  });
}
