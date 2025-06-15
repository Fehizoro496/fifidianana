import 'package:fifidianana/app/models/election_model.dart';
import 'package:flutter/material.dart';

class ElectionCard extends StatelessWidget {
  final Election election;
  const ElectionCard({super.key, required this.election});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Fifidianana biraon'ny ${election.sampana.toUpperCase()}",
              maxLines: 2,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Chip(
                side: BorderSide.none,
                color: MaterialStatePropertyAll(Colors.blue.withOpacity(.25)),
                label: Text(
                  election.etat,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 21, 91, 148)),
                  // color: Color.fromARGB(255, 21, 91, 148)),
                ),
              ),
            ),
            Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Date :',
                      style: TextStyle(color: Colors.black38, fontSize: 12.0),
                    ),
                    Text(
                      election.date.toString().split(' ')[0],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Candidats :',
                      style: TextStyle(color: Colors.black38, fontSize: 12.0),
                    ),
                    Text(
                      '04',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
