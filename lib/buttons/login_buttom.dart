import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginButtom extends StatefulWidget {
  // Controladores do texto
  @override
  _LoginButtomState createState() => _LoginButtomState();
}

class _LoginButtomState extends State<LoginButtom> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Form(
      key: _formKey,
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Container(
            height: MediaQuery.of(context).size.height / 18,
            child: OutlinedButton.icon(
              icon: FaIcon(FontAwesomeIcons.shopify),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  userManager.signIn(
                    user: User(
                      email: _emailController.text,
                      password: _passController.text,
                    ),
                    onFail: (e) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Falhar ao entrar: $e'),
                      //     backgroundColor: Colors.red,
                      //   ),
                      // );
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error ao entrar :\n$e'),
                            actions: [
                              OutlinedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  primary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Fechar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onSuccess: () {
                      // TODO: FECHAR TELA DE LOGIN
                    },
                  );
                }
              },
              label: Text(
                "Entrar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: TextButton.styleFrom(
                elevation: 0,
                backgroundColor: primaryColor,
                primary: Colors.white,
                shape: StadiumBorder(),
              ),
            ),
          );
        },
      ),
    );
  }
}
