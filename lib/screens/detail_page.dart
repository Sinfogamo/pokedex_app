import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokedex_app_tri/models/pokemon_model.dart';
import 'package:pokedex_app_tri/service/pokemon_service.dart';
import 'package:pokedex_app_tri/theme/colors.dart';
import 'package:pokedex_app_tri/widgets/gridtype_widget.dart';
import 'package:pokedex_app_tri/widgets/stats_widget.dart';

class DetailsPokemon extends StatefulWidget {
  final int imageId;
  final String name;
  DetailsPokemon(this.imageId, this.name);

  @override
  _DetailsPokemonState createState() => _DetailsPokemonState(imageId, name);
}

class _DetailsPokemonState extends State<DetailsPokemon> {
  final int imageId;
  final String name;
  _DetailsPokemonState(this.imageId, this.name);
  Future<Pokemon> info;
  Future<Characteristic> characteristic;
  int colorBackgroud = 18;

  @override
  void initState() {
    super.initState();
    info = informationPokemon(imageId);
    characteristic = characteristicsPokemon(imageId);
    Future.delayed(Duration(milliseconds: 100), () => listColor(info));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: colors[colorBackgroud],
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: colors[colorBackgroud],
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        )),
                  )),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 250.0,
            ),
            Container(child: Expanded(child: futureGridType(info, context))),
          ],
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: 'pokemon$imageId',
                  child: FadeInImage.assetNetwork(
                    imageScale: 3.0,
                    placeholderScale: 3.0,
                    placeholder: 'assets/pokeball.gif',
                    image:
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$imageId.png',
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            FutureBuilder(
              future: characteristic,
              builder: (BuildContext context,
                  AsyncSnapshot<Characteristic> snapshot) {
                if (snapshot.hasData) {
                  List<Description> description = snapshot.data.descriptions;
                  print(description.length);
                  return Text(description[2].description);
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 70.0,
            ),
            Expanded(child: statsWidget(info)),
          ],
        ),
      ]),
    );
  }

  listColor(Future<Pokemon> info) {
    String type = '';

    Future.delayed(Duration(milliseconds: 100), () async {
      type = await info.then((value) => type = value.types[0].type.name);
      colorBackgroud = colorList(type);
      setState(() {});
    });
  }
}
