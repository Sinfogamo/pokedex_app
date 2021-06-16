import 'package:http/http.dart' as http;
import 'package:pokedex_app_tri/models/pokemon_model.dart';
import 'dart:convert' as convert;

import 'package:pokedex_app_tri/shared/user_preferences.dart';

Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151&offset=0');
UserPreferents prefs = new UserPreferents();

// ignore: missing_return
Future<bool> getPokemonList() async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var result = jsonResponse['results'];
    prefs.pokemonListCache = convert.jsonEncode(result);
    return true;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<List> decodePokemonList() async {
  List result = convert.jsonDecode(prefs.pokemonListCache);
  return result;
}

// ignore: missing_return
Future<Pokemon> informationPokemon(int id) async {
  Uri urlInfo = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
  var response = await http.get(urlInfo);
  if (response.statusCode == 200) {
    var infoPokemon = convert.jsonDecode(response.body);
    Map<String, dynamic> info = infoPokemon;
    Pokemon infopokemon = Pokemon.fromJson(info);
    return infopokemon;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

// ignore: missing_return
Future<Characteristic> characteristicsPokemon(int id) async {
  Uri urlInfo = Uri.parse('https://pokeapi.co/api/v2/characteristic/$id');
  var response = await http.get(urlInfo);
  if (response.statusCode == 200) {
    var infoPokemon = convert.jsonDecode(response.body);
    Map<String, dynamic> info = infoPokemon;
    Characteristic characteristic = Characteristic.fromJson(info);
    return characteristic;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
