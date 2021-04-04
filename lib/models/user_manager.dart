import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual/helpers.dart/firebase_errors.dart';

import 'user.dart';

class UserManager extends ChangeNotifier {
  // Instanciando o FirebaseAuth
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Variavel de verificação do loading
  bool loading = false;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    setLoading(true);
    try {
      // ignore: unused_local_variable
      final AuthResult result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }

    setLoading(false);
  }

  // Verificando o estado do loading
  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

 
}
