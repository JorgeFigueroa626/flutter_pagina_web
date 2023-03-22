import 'package:flutter/material.dart';
import 'package:flutter_pagina_web/src/widget/responsive_widget.dart';

class ScreenShotsContent extends ResponsiveWidget {
  const ScreenShotsContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) =>
      const ScreenshotsContentResponsive(200);

  @override
  Widget buildMobile(BuildContext context) =>
      const ScreenshotsContentResponsive(24);
}

class ScreenshotsContentResponsive extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final horizontalPadding;

  const ScreenshotsContentResponsive(this.horizontalPadding, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            const Text(
              "ScreenShots Section",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  _Image(image: "assets/images/screenshots/screen1.png"),
                  _Image(image: "assets/images/screenshots/screen2.png"),
                  _Image(image: "assets/images/screenshots/screen3.png"),
                  _Image(image: "assets/images/screenshots/screen4.png"),
                  _Image(image: "assets/images/screenshots/screen5.png"),
                  _Image(image: "assets/images/screenshots/screen6.png"),
                  _Image(image: "assets/images/screenshots/screen7.png"),
                  _Image(image: "assets/images/screenshots/screen1.png"),
                  _Image(image: "assets/images/screenshots/screen2.png"),
                  _Image(image: "assets/images/screenshots/screen3.png"),
                  _Image(image: "assets/images/screenshots/screen4.png"),
                  _Image(image: "assets/images/screenshots/screen5.png"),
                  _Image(image: "assets/images/screenshots/screen6.png"),
                  _Image(image: "assets/images/screenshots/screen7.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Image.asset(image),
        const SizedBox(width: 16),
      ],
    );
  }
}
