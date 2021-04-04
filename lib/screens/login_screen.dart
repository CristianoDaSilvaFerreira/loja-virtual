import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja_virtual/helpers.dart/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores do texto
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  // key de validação
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // visibilidade do "olhinho"
  bool _toggleVisibility = true;
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
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                // ========== Field Email ========== //
                TextFormField(
                  decoration: InputDecoration(
                    // icon: Icon(Icons.email_outlined),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'E-mail',
                    hintText: 'Entrer com seu o e-email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 3,
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (email) {
                    if (!emailValid(email)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // ========== Field Senha ========== //
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _toggleVisibility = !_toggleVisibility;
                        });
                      },
                    ),
                    labelText: 'Senha',
                    hintText: 'Informe sua senha',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 3,
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: _toggleVisibility,
                  controller: _passController,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6) {
                      return "Senha inválida";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16),

                // ========== Botão Entrar ========== //
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  child: OutlinedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.shopify),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        context.read<UserManager>().signIn(
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
                            });
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
                ),
                Divider(
                  height: 25,
                  color: primaryColor,
                ),

                // ========== Botão Facebook ========== //
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  child: OutlinedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                    label: Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // ========== Botão Google ========== //
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  child: OutlinedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                    label: Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // ========== Field e campo Inscrever-se ========== //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Inscrever-se agora',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                // ========== Field esqueceu a senha ========== //
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
