import 'package:flutter/material.dart';
import 'package:projeto_doce/pages/home/home_strings.dart';
import 'package:projeto_doce/routes/route_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(HomeStrings.logo),
            const Text(
              HomeStrings.description,
              textAlign: TextAlign.center,
            ),
            const VerticalDivider(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteStrings.candyList);
              },
              child: const Text(HomeStrings.button),
            )
          ],
        ),
      ),
    );
  }
}
