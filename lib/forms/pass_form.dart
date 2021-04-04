import 'package:flutter/material.dart';

class PassForm extends StatefulWidget {
  // Controladores do texto
  @override
  _PassFormState createState() => _PassFormState();
}

class _PassFormState extends State<PassForm> {
  TextEditingController _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _toggleVisibility = true;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Form(
      key: _formKey,
      child: TextFormField(
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
    );
  }
}
