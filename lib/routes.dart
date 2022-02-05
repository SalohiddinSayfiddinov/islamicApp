import 'package:flutter/material.dart';
import 'package:imtihon/screens/homepage.dart';
import 'package:imtihon/screens/masjid_page.dart';
import 'package:imtihon/screens/namoz_vaqtlari_page.dart';

class RouteGenerator {
  static generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/namozVaqtlari':
        return MaterialPageRoute(
          builder: (context) => NamozVaqtlari(
            title: args.toString(),
          ),
        );
      case '/masjidPage':
        return MaterialPageRoute(
          builder: (context) => const MasjidPage(),
        );
    }
  }
}
