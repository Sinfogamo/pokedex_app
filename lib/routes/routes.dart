import 'package:flutter/material.dart';
import 'package:pokedex_app_tri/screens/home_page.dart';
import 'package:pokedex_app_tri/screens/pokedex_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(),
    '/pokedex': (BuildContext context) => PokemonPage(),
  };
}
