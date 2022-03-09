import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_app_tri/models/pokemon_model.dart';
import 'package:pokedex_app_tri/theme/colors.dart';

Widget statsWidget(Future<Pokemon> info) {
  return FutureBuilder(
    future: info,
    builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
      if (snapshot.hasData) {
        List<Stat> stats = snapshot.data.stats;
        List<Type> type = snapshot.data.types;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(left: 10.0),
            itemCount: stats.length,
            itemBuilder: (BuildContext ctx, index) {
              return ListTile(
                  subtitle: Text(stats[index].stat.name),
                  title: Row(
                    children: [
                      Text("${stats[index].baseStat}.0"),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.7,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2500,
                        percent: stats[index].baseStat / 100 > 1.0
                            ? 1.0
                            : stats[index].baseStat / 100,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: colors[colorList(type[0].type.name)],
                      ),
                    ],
                  ));
            });
      } else {
        return Center(
          child: Container(),
        );
      }
    },
  );
}
