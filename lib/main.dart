import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: "Flutter's Clothing",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 255, 105, 114),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
