import 'package:flutter/material.dart';
import 'package:imtihon/screens/about_page.dart';
import 'package:imtihon/screens/asd.dart';
import 'package:imtihon/screens/besh_ustun_page.dart';
import 'package:imtihon/screens/duo_page.dart';
import 'package:imtihon/screens/duonom_page.dart';
import 'package:imtihon/screens/homepage.dart';
import 'package:imtihon/screens/masjid_page.dart';
import 'package:imtihon/screens/namoz_vaqtlari_page.dart';
import 'package:imtihon/screens/suralar_page.dart';
import 'package:imtihon/screens/suranom_page.dart';
import 'package:imtihon/screens/tasbeh_nomlari_page.dart';
import 'package:imtihon/screens/tasbeh_page.dart';

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
      case '/tasbehPage':
        return MaterialPageRoute(
          builder: (context) => TasbehPage(title: args.toString()),
        );
      case '/tasbehNomlariPage':
        return MaterialPageRoute(
          builder: (context) => const TasbehNomlariPage(),
        );
      case '/duoPage':
        return MaterialPageRoute(
          builder: (context) => DuoPage(
            duo: args.toString(),
          ),
        );
      case '/duoNomPage':
        return MaterialPageRoute(
          builder: (context) => const DuoNomPage(),
        );
      case '/suraNomPage':
        return MaterialPageRoute(
          builder: (context) => const SuraNomPage(),
        );
      case '/suralarPage':
        return MaterialPageRoute(
          builder: (context) => SuralarPage(
            sura: args.toString(),
          ),
        );
      case '/beshUstunPage':
        return MaterialPageRoute(
          builder: (context) => BeshUstunPage(),
        );
      case '/aboutPage':
        return MaterialPageRoute(
          builder: (context) => AboutPage(),
        );
    }
  }
}
