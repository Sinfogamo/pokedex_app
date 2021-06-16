import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_app_tri/theme/theme.dart';

Future<bool> goBackExit(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(
                'Salir de la Aplicacion',
                textAlign: TextAlign.center,
              ),
              content: Container(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      '¿Esta seguro que desea salir de la Aplicación?',
                      textAlign: TextAlign.center,
                    )
                  ])),
              actions: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: raisedButton,
                        child: new Text(
                          "Continuar",
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        style: raisedButtonOrange,
                        child: new Text(
                          "Salir",
                        ),
                        onPressed: () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        },
                      ),
                    ],
                  ),
                )
              ]));
}
