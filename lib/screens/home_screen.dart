import 'package:flutter/material.dart';
import '../tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {

  // Controladores da página
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,

      // Impedido que seja arratasdo para troca de tela
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeTab(),
      ],
    );
  }
}
