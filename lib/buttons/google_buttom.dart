import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButtom extends StatefulWidget {
  @override
  _GoogleButtomState createState() => _GoogleButtomState();
}

class _GoogleButtomState extends State<GoogleButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
