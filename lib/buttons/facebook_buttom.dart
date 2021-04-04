import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookButton extends StatefulWidget {
  @override
  _FacebookButtonState createState() => _FacebookButtonState();
}

class _FacebookButtonState extends State<FacebookButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
