import 'package:flutter/material.dart';
import '../tabs/products_tab.dart';
import '../widgets/custom_drawer.dart';
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
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias "),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.blue),
        Container(color: Colors.green),
        Container(color: Colors.grey),
      ],
    );
  }
}
