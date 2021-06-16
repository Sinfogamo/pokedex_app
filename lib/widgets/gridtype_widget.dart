import 'package:flutter/material.dart';
import 'package:pokedex_app_tri/models/pokemon_model.dart';

Widget futureGridType(Future<Pokemon> info, BuildContext context) {
  return FutureBuilder(
      future: info,
      builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
        if (snapshot.hasData) {
          List<Type> type = snapshot.data.types;
          bool grid = false;
          if (type.length > 1) {
            grid = true;
          }
          return grid
              ? GridView.count(
                  physics:
                      ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  children: List.generate(type.length, (index) {
                    return _createCard(type[index].type.name);
                  }),
                )
              : Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 55.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              height: 60,
                              child: _createCard(type[0].type.name)))),
                );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

Widget _createCard(String image) {
  return Image(image: AssetImage('assets/tags/$image.png'));
}
