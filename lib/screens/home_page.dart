import 'package:flutter/material.dart';
import 'package:pokedex_app_tri/models/validation.dart';
import 'package:pokedex_app_tri/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputUserController = TextEditingController();
  TextEditingController _inputPasswordController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokémon"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset("assets/pokedex.png"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                createForm(),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: createButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  createButton() {
    return ElevatedButton(
        style: raisedButton,
        child: Text(
          "Entrar",
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            FocusScope.of(context).unfocus();
            if (validationAcces(
                    _inputUserController.text, _inputPasswordController.text) ==
                true) {
              Navigator.pushReplacementNamed(context, '/pokedex');
            } else {
              print("Todo esta mal");
            }
          }
          // Navigator.pushReplacementNamed(context, '/screen2');
        });
  }

  createForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                textCapitalization: TextCapitalization.none,
                controller: _inputUserController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: "Usuario",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.person,
                      semanticLabel: "Usuario",
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: userValidation,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                obscureText: true,
                textCapitalization: TextCapitalization.none,
                controller: _inputPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  labelText: "Contraseña",
                  suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.remove_red_eye,
                      semanticLabel: "Contraseña",
                    ),
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: passwordValidation,
              ),
            ),
          ],
        ));
  }
}
