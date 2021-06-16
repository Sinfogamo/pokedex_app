import 'package:shared_preferences/shared_preferences.dart';

class UserPreferents {
  static final UserPreferents _instance = new UserPreferents._internal();

  factory UserPreferents() {
    return _instance;
  }

  UserPreferents._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get pokemonListCache {
    return _prefs.getString('listPokemon') ?? '';
  }

  set pokemonListCache(String value) {
    _prefs.setString('listPokemon', value);
  }
}
