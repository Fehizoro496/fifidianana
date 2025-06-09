import 'package:hive/hive.dart';

part 'election_model.g.dart';

@HiveType(typeId: 0)
class Election extends HiveObject {
  @HiveField(0)
  String poste;

  @HiveField(1)
  String sampana;

  @HiveField(2)
  int nombreDeVoteBlanc;

  @HiveField(3)
  int nombreDeVoteInvalide;

  @HiveField(4)
  DateTime date;

  @HiveField(5)
  String get etat => _etat;

  set etat(String value) {
    if (!ELECTION_STATES.contains(value)) {
      throw ArgumentError(
          "Invalid value for etat. Must be one of: $ELECTION_STATES");
    }
    _etat = value;
  }

  late String _etat;

  Election({
    required this.poste,
    required this.sampana,
    this.nombreDeVoteBlanc = 0,
    this.nombreDeVoteInvalide = 0,
    required this.date,
    String etat = ELECTION_EN_ATTENTE,
  }) : _etat = etat {
    if (!ELECTION_STATES.contains(etat)) {
      throw ArgumentError(
          "Invalid value for etat. Must be one of: $ELECTION_STATES");
    }
  }
}

typedef ElectionState = String;
const ELECTION_EN_COURS = "en cours";
const ELECTION_EN_ATTENTE = "en attente";
const ELECTION_TERMINE = "terminée";

const Set<ElectionState> ELECTION_STATES = {
  ELECTION_EN_COURS,
  ELECTION_EN_ATTENTE,
  ELECTION_TERMINE,
};
