import 'dart:core';
import 'package:flutter/material.dart';
import 'package:pokedex_app_tri/screens/detail_page.dart';
import 'package:pokedex_app_tri/service/pokemon_service.dart';
import 'package:pokedex_app_tri/shared/user_preferences.dart';
import 'package:pokedex_app_tri/widgets/show_dialog_widget.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  Future<List> pokemonList;
  final UserPreferents prefs = UserPreferents();

  @override
  void initState() {
    super.initState();

    if (prefs.pokemonListCache == '') {
      getPokemonList();
      _addCacheList();
    } else {
      pokemonList = decodePokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goBackExit(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Pokémon"),
            centerTitle: true,
          ),
          body: FutureBuilder(
            future: pokemonList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: 151,
                  itemBuilder: (context, index) {
                    int imageId = index + 1;
                    return ListTile(
                      onTap: () => (Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => DetailsPokemon(
                                  imageId, snapshot.data[index]['name'])))),
                      leading: Hero(
                        tag: 'pokemon$imageId',
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/pokeball.gif',
                          image:
                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$imageId.png',
                        ),
                      ),
                      title: Text(snapshot.data[index]['name']),
                      subtitle: Text("#$imageId"),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
    // return Container();
  }

  Future<void> _addCacheList() async {
    await Future.delayed(Duration(seconds: 2));
    pokemonList = decodePokemonList();
    setState(() {});
  }
}
