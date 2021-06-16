import 'package:flutter/material.dart';

Color bug = Color(0xFF92BC2C);
Color dark = Color(0xFF595761);
Color dragon = Color(0xFF0C69C8);
Color electric = Color(0xFFEDD53E);
Color fairy = Color(0xFFEC8CE5);
Color fighting = Color(0xFFCE4265);
Color fire = Color(0xFFFB9B51);
Color flying = Color(0xFF90A7DA);
Color ghost = Color(0xFF516AAC);
Color grass = Color(0xFF5FBC51);
Color ground = Color(0xFFDC7545);
Color ice = Color(0xFF70CCBD);
Color normal = Color(0xFF9298A4);
Color poison = Color(0xFFA864C7);
Color psychic = Color(0xFFF66F71);
Color rock = Color(0xFFC5B489);
Color steel = Color(0xFF52869D);
Color water = Color(0xFF559EDF);

List<Color> colors = [
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
  Colors.red
];

int colorList(String type) {
  int id;
  switch (type) {
    case 'bug':
      id = 0;
      break;
    case 'dark':
      id = 1;
      break;
    case 'dragon':
      id = 2;
      break;
    case 'electric':
      id = 3;
      break;
    case 'fairy':
      id = 4;
      break;
    case 'fighting':
      id = 5;
      break;
    case 'fire':
      id = 6;
      break;
    case 'flying':
      id = 7;
      break;
    case 'ghost':
      id = 8;
      break;
    case 'grass':
      id = 9;
      break;
    case 'ground':
      id = 10;
      break;
    case 'ice':
      id = 11;
      break;
    case 'normal':
      id = 12;
      break;
    case 'poison':
      id = 13;
      break;
    case 'psychic':
      id = 14;
      break;
    case 'rock':
      id = 15;
      break;
    case 'steel':
      id = 16;
      break;
    case 'water':
      id = 17;
      break;
  }
  return id;
}
