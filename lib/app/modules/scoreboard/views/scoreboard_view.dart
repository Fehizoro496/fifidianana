import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../controllers/scoreboard_controller.dart';

class ScoreboardView extends GetView<ScoreboardController> {
  const ScoreboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScoreboardController>(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('ScoreboardView'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.amber,
                  width: 450,
                  child: ListView.builder(
                    itemCount: controller.candidats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            controller.candidats[index].pseudo,
                            // textScaling: TextScaling.scale,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: CustomPaint(
                            painter: TextPainterWidget(
                              text: "$index",
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        subtitle: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "${controller.candidats[index].nombreDeVoie}",
                            // textScaling: TextScaling.scale,
                          ),
                        ),
                        trailing: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            IconButton.outlined(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton.filled(
                                onPressed: () {
                                  controller.incrementVoice(index);
                                },
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 450,
                  child: Column(
                    children: [
                      Expanded(
                        // height: Get.height / 2,
                        child: Container(
                          // color: Colors.red,
                          child: PieChart(
                            PieChartData(
                              sections: controller.candidats.map((candidat) {
                                return PieChartSectionData(
                                  value: candidat.nombreDeVoie.toDouble(),
                                  title: candidat.pseudo,
                                  color: Colors.primaries[
                                      controller.candidats.indexOf(candidat) %
                                          Colors.primaries.length],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Expanded(
                          child: Container(
                              color: Colors.green,
                              child: ListView.builder(
                                itemCount: controller.sortedCandidats.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        controller
                                            .sortedCandidats[index].pseudo,
                                        // textScaling: TextScaling.scale,
                                      ),
                                    ),
                                    trailing: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '${controller.sortedCandidats[index].nombreDeVoie}',
                                        // textScaling: TextScaling.scale,
                                      ),
                                    ),
                                  );
                                },
                              )))
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}

class TextPainterWidget extends CustomPainter {
  final String text;
  final TextStyle textStyle;

  TextPainterWidget({required this.text, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
