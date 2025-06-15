import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'election_model.dart';

part 'candidat_model.g.dart';

@HiveType(typeId: 1)
class Candidat extends HiveObject {
  @HiveField(0)
  int numero;

  @HiveField(1)
  String nom;

  @HiveField(2)
  String pseudo;

  @HiveField(3)
  int nombreDeVoie;

  @HiveField(4)
  Election election;

  @HiveField(5)
  String poste;

  @HiveField(6)
  int colorFactor;

  Candidat(
      {required this.numero,
      required this.nom,
      required this.pseudo,
      this.nombreDeVoie = 0,
      required this.election,
      required this.poste,
      required this.colorFactor});

  void incrementVoice() {
    nombreDeVoie += 1;
  }

  void decerementVoice() {
    nombreDeVoie -= 1;
  }
}
