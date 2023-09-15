import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomVerticalDivider extends StatelessWidget {
  CustomVerticalDivider(this.height, {super.key});

  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

// ignore: must_be_immutable
class CustomHorizontalDivider extends StatelessWidget {
  CustomHorizontalDivider(this.width, {super.key});

  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
