String userValidation(String value) {
  if (value.isEmpty) {
    return 'Ingrese su usuario';
  }
  return null;
}

String passwordValidation(String value) {
  if (value.isEmpty) {
    return 'Ingrese su contraseña';
  }
  return null;
}

bool validationAcces(String user, String password) {
  bool validador = false;
  if (user == 'prueba' && password == 'prueba') {
    validador = true;
  }
  return validador;
}
