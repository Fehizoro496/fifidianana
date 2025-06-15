import 'package:fifidianana/app/models/election_model.dart';
import 'package:fifidianana/app/modules/home/views/components/election_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          // appBar: AppBar(
          //   title: const Text('Fifidianana'),
          //   centerTitle: true,
          //   actions: [
          //     TextButton(
          //         onPressed: () {
          //           controller.deleteAllElections();
          //         },
          //         // child: Text('Clear'))
          //   ],
          // ),
          body: Column(
        children: [
          const SizedBox(
            height: (kToolbarHeight / 3) * 2,
          ),
          Image.asset('assets/logo_metm.png'),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {
                  Get.dialog(Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0)),
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Ajout éléction'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              controller: controller.sampanaCtrl,
                              decoration: InputDecoration(
                                focusColor: Colors.blue,
                                labelText: 'Sampana',
                                // prefixIcon: const Icon(Icons.person,
                                //     color: Colors.black54),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.black12,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              controller: controller.dateCtrl,
                              readOnly: true,
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2026),
                                  cancelText: 'Annuler',
                                  confirmText: 'Confirmer',
                                  helpText: 'Sélectionner une date',
                                );
                                if (date != null) {
                                  controller.dateCtrl.text =
                                      date.toString().split(' ')[0];
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.black12,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.resetInputValues();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Annuler',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.addElection();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    // padding:
                                    //     const EdgeInsets.symmetric(vertical: 16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ajouter',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Ajouter une nouvelle élection',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0),
                ),
              ),
            ),
          ),
          const Divider(
            indent: kToolbarHeight,
            endIndent: kToolbarHeight,
          ),
          Expanded(
            child: FutureBuilder(
                future: controller.getAllElections(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Election election = snapshot.data![index];
                        return GestureDetector(
                          onTap: () =>
                              Get.toNamed('/scoreboard/${election.key}'),
                          child: ElectionCard(
                            election: election,
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Aucune élection à afficher'),
                    );
                  }
                }),
          ),
        ],
      ));
    });
  }
}
