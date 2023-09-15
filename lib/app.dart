import 'package:flutter/material.dart';
import 'package:projeto_doce/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // O MaterialApp é o componente principal, ele é o pai de todos os outros widgets, ex:
  // MaterialApp -> Scaffold -> Column...

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      routes: Routes.routes,
      navigatorKey: Routes.navigatorKey,
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
