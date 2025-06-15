import 'dart:ui';

import 'package:fifidianana/app/models/candidat_model.dart';
import 'package:fifidianana/app/services/hive_service.dart';
import 'package:get/get.dart';

class ScoreboardController extends GetxController {
  final HiveService hiveService = Get.find<HiveService>();
  final election = Get.arguments['election'];
  List<Candidat> candidats = [];
  List<Candidat> candidatsTemp = [
    Candidat(
        numero: 1,
        nom: 'RAZANAMALALA Vololona',
        pseudo: "Mme Lala",
        election: Get.arguments['election'],
        poste: "TONIA",
        colorFactor: 1),
    Candidat(
        numero: 2,
        nom: 'ANDRIANIRIMAHAFALY Judith',
        pseudo: "Mme Judith",
        election: Get.arguments['election'],
        poste: "TONIA",
        colorFactor: 17),
    Candidat(
        numero: 1,
        nom: 'RAZAKAMANGA Rolland',
        pseudo: "Mr Rolland",
        election: Get.arguments['election'],
        poste: "TONIA LEFITRA",
        colorFactor: 3),
    Candidat(
        numero: 1,
        nom: 'RAZAFINDRAKOTO Lalatiana',
        pseudo: "Mme Lalatiana",
        election: Get.arguments['election'],
        poste: "MPITAHIRY VOLA",
        colorFactor: 15),
    Candidat(
        numero: 1,
        nom: 'RAMAVOARISOA Voahangy',
        pseudo: "Mme Voahangy",
        election: Get.arguments['election'],
        poste: "MPITANTSORATRY NY VOLA",
        colorFactor: 5),
    Candidat(
        numero: 1,
        nom: 'RAZAFINDRAIBE Harivelo Eva Luna',
        pseudo: "Mme Luna",
        election: Get.arguments['election'],
        poste: "MPANOLOTSAINA",
        colorFactor: 13),
    Candidat(
        numero: 2,
        nom: 'RAKOTOARIVELO Jacky',
        pseudo: "Mr Jacky",
        election: Get.arguments['election'],
        poste: "MPANOLOTSAINA",
        colorFactor: 7),
    Candidat(
        numero: 3,
        nom: 'ANDRIANTSOLO Lala Albert',
        pseudo: "Mr Albert",
        election: Get.arguments['election'],
        poste: "MPANOLOTSAINA",
        colorFactor: 1),
    Candidat(
        numero: 4,
        nom: 'RAHARIMALALA Lantoniaina',
        pseudo: "Mme Lanto",
        election: Get.arguments['election'],
        poste: "MPANOLOTSAINA",
        colorFactor: 11),
    Candidat(
        numero: 1,
        nom: 'RANOELIARIMANANA Simone',
        pseudo: "Mme Simone",
        election: Get.arguments['election'],
        poste: "CONTROLLEUR",
        colorFactor: 17),
    Candidat(
        numero: 2,
        nom: 'ANDRIANTSARAFARA Ony',
        pseudo: "Mr Ony",
        election: Get.arguments['election'],
        poste: "CONTROLLEUR",
        colorFactor: 1),
    Candidat(
        numero: 3,
        nom: 'RAMANJAHARY Hanitra',
        pseudo: "Mme Hanitra",
        election: Get.arguments['election'],
        poste: "CONTROLLEUR",
        colorFactor: 10),
    Candidat(
        numero: 4,
        nom: 'RAHAMEFIARISOA Samy',
        pseudo: "Dadatoa Samy",
        election: Get.arguments['election'],
        poste: "CONTROLLEUR",
        colorFactor: 15),
  ];
  List<Candidat> sortedCandidats = [];

  // final count = 0.obs;
  @override
  void onInit() async {
    // await hiveService.deleteAllCandidats();
    // candidatsTemp.forEach((candidat) async {
    //   await hiveService.addCandidat(candidat);
    //   print('candidat ${candidat.pseudo} added');
    // });
    candidats = await hiveService.getCandidatsByElection(election);
    // candidats = await hiveService.getAllCandidats();
    print(candidats.map((e) => e.election.sampana));
    sortedCandidats.addAll(candidats);
    sortCandidat();
    update();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void incrementVoice(int index) {
    candidats[index].incrementVoice();
    hiveService.updateCandidat(candidats[index]);
    sortCandidat();
    update();
  }

  void decrementVoice(int index) {
    candidats[index].decerementVoice();
    hiveService.updateCandidat(candidats[index]);
    sortCandidat();
    update();
  }

  // void increment() => count.value++;
  sortCandidat() {
    sortedCandidats.sort((a, b) {
      return (a.nombreDeVoie > b.nombreDeVoie)
          ? -1
          : (a.nombreDeVoie < b.nombreDeVoie)
              ? 1
              : 0;
    });
    // print(discussions.map((e) => e.name));
    update();
  }

  double calculatePercentage(int votes) {
    int totalVotes =
        candidats.fold(0, (sum, candidat) => sum + candidat.nombreDeVoie);
    if (totalVotes == 0) return 0;
    return (votes / totalVotes) * 100;
  }

  Map<String, List<Candidat>> getCandidatsByPoste() {
    Map<String, List<Candidat>> grouped = {};
    for (var candidat in candidats) {
      if (!grouped.containsKey(candidat.poste)) {
        grouped[candidat.poste] = [];
      }
      grouped[candidat.poste]!.add(candidat);
    }
    return grouped;
  }

  double calculatePercentageByPoste(int votes, String poste) {
    List<Candidat> candidatsForPoste = getCandidatsByPoste()[poste] ?? [];
    int totalVotes = candidatsForPoste.fold(
        0, (sum, candidat) => sum + candidat.nombreDeVoie);
    if (totalVotes == 0) return 0;
    return (votes / totalVotes) * 100;
  }
}
