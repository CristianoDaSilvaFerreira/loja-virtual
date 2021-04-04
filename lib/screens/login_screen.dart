import 'package:flutter/material.dart';
import 'package:loja_virtual/buttons/facebook_buttom.dart';
import 'package:loja_virtual/buttons/forget_buttom.dart';
import 'package:loja_virtual/buttons/google_buttom.dart';
import 'package:loja_virtual/buttons/login_buttom.dart';
import 'package:loja_virtual/buttons/register_buttm.dart';
import 'package:loja_virtual/forms/email_form.dart';
import 'package:loja_virtual/forms/pass_form.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // key de validação
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text("ENTRAR"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: _formKey,
              child: Consumer<UserManager>(
                builder: (_, userManager, __) {
                  return ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: <Widget>[
                      // ========== Field Email ========== //
                      EmailForm(),

                      SizedBox(height: 20),

                      // ========== Field Senha ========== //
                      PassForm(),

                      SizedBox(height: 16),

                      // ========== Botão Entrar ========== //
                      LoginButtom(),

                      Divider(
                        height: 25,
                        color: primaryColor,
                      ),

                      // ========== Botão Facebook ========== //
                      FacebookButton(),

                      SizedBox(height: 25),

                      // ========== Botão Google ========== //
                      GoogleButtom(),
                      SizedBox(height: 20),

                      // ========== Field e campo Inscrever-se ========== //

                      ForgetButtom(),

                      // ========== Field esqueceu a senha ========== //
                      RegisterButtom(),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
