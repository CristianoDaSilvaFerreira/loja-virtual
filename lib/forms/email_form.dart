import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers.dart/validators.dart';

class EmailForm extends StatefulWidget {
  // Controladores do texto
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Form(
      key: _formKey,
      child: TextFormField(
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
    );
  }
}
