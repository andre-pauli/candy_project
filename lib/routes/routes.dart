import 'package:flutter/material.dart';
import 'package:projeto_doce/pages/candy_list/candy_list_page.dart';
import 'package:projeto_doce/pages/candy/candy_page.dart';
import 'package:projeto_doce/pages/home/home_page.dart';
import 'package:projeto_doce/routes/route_strings.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    RouteStrings.home: (context) => const HomePage(),
    RouteStrings.candyList: (context) => const CandyListPage(),
    RouteStrings.candy: (context) => const CandyPage(),
  };

  static String initial = RouteStrings.home;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
