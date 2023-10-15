import 'package:flutter/material.dart';
import 'package:pit_box/core/constant/size.dart';
import 'package:pit_box/core/constant/sized_box.dart';
import 'package:stroke_text/stroke_text.dart';

class ChampionShipScreen extends StatelessWidget {
  ChampionShipScreen({super.key});

  List<String> driverImageList = [
    'assets/images/drivers/maxverstappen.png',
    'assets/images/drivers/fernandoalonso.png',
    'assets/images/drivers/lewishamilton.png',
    'assets/images/drivers/charlesleclerc.png',
    'assets/images/drivers/sergioperez.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              hBox12,
              Text(
                "All Drivers",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        wBox8,
                        Text(
                          "1",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StrokeText(
                              text: "MAX",
                              strokeColor:
                                  Theme.of(context).secondaryHeaderColor,
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                              strokeWidth: 3,
                            ),
                            Text(
                              "VERSTAPPEN",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor,
                              ),
                            ),
                            Text("RedBull Racing",
                                style: Theme.of(context).textTheme.bodySmall),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Stack(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "265",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 5,
                                        child: Text(
                                          "PTS",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                wBox25,
                                SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                      "assets/images/flag/netherlands_flag.png"),
                                ),
                                hBox5,
                              ],
                            )
                          ],
                        ),
                        wBox8,
                        SizedBox(
                          height: size.width * 0.30,
                          width: size.width * 0.30,
                          child: Stack(
                            children: [
                              Image.asset(
                                  'assets/images/team_logo/redbull.png'),
                              Image.asset(driverImageList[0]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
