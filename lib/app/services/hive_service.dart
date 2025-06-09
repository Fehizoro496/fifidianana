import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/election_model.dart';
import '../models/candidat_model.dart';

class HiveService extends GetxService {
  late Box<Election> electionsBox;
  late Box<Candidat> candidatsBox;

  Future<HiveService> init() async {
    // final appDocDir = await getExternalStorageDirectory();
    final appDocDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocDir.path);

    Hive.registerAdapter(ElectionAdapter());
    Hive.registerAdapter(CandidatAdapter());

    electionsBox = await Hive.openBox<Election>('elections');
    candidatsBox = await Hive.openBox<Candidat>('candidats');

    return this;
  }

  Election? getElectionByKey(dynamic key) {
    return electionsBox.get(key);
  }

  Future<void> addCandidat(Candidat candidat) async {
    await candidatsBox.add(candidat);
  }

  Future<void> addElection(Election election) async {
    await electionsBox.add(election);
  }

  Future<List<Election>> getAllElections() async {
    return electionsBox.values.toList();
  }

  List<Election> get allElections => electionsBox.values.toList();
  List<Candidat> get allCandidats => candidatsBox.values.toList();

  List<Candidat> getCandidatsByElection(Election election) {
    return candidatsBox.values
        .where((candidat) => candidat.election.key == election.key)
        .toList();
  }

  Future<void> updateCandidat(Candidat candidat) async {
    await candidat.save();
  }

  Future<void> deleteCandidat(Candidat candidat) async {
    await candidat.delete();
  }

  Future<void> deleteElection(Election election) async {
    await election.delete();
  }

  Future<void> deleteAllElections() async {
    await electionsBox.clear();
  }

  void closeBoxes() {
    electionsBox.close();
    candidatsBox.close();
  }
}
