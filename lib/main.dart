import 'package:flutter/material.dart';
import 'package:pokedex_app_tri/routes/routes.dart';
import 'package:pokedex_app_tri/screens/home_page.dart';
import 'package:pokedex_app_tri/shared/user_preferences.dart';
import 'package:pokedex_app_tri/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await new UserPreferents().initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeLight().Theme,
      home: HomePage(),
      routes: getApplicationRoutes(),
    );
  }
}
