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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Fifidianana ${election.poste} ${election.sampana}',
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                Chip(
                  side: BorderSide.none,
                  color: MaterialStatePropertyAll(Colors.blue.withOpacity(.25)),
                  label: Text(
                    election.etat,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 21, 91, 148)),
                    // color: Color.fromARGB(255, 21, 91, 148)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Sampana :'), Text(election.sampana)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Poste :'), Text(election.poste)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date :'),
                Text(election.date.toString().split(' ')[0])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
