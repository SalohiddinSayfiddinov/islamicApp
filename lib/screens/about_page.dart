import 'package:flutter/material.dart';
import 'package:imtihon/core/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Biz Haqimizda"),
      body: Text(
        "Sayfiddinov Salohiddin, Najot Ta'lim O'quv Markazi, Flutter 3",
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
      ),
    );
  }
}
