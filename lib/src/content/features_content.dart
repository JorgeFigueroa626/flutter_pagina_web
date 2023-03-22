import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagina_web/src/widget/responsive_widget.dart';

const youtubeVideo = 'https://www.youtube.com/watch?v=Wc5OBu6PaKQ';

class FeaturesContent extends ResponsiveWidget {
  FeaturesContent({Key? key}) : super(key: key) {
    ui.platformViewRegistry.registerViewFactory(
      'youtube-video',
      (int viewId) => IFrameElement()
        ..src = youtubeVideo
        ..style.width = '100%'
        ..style.height = '100%',
    );
  }

  @override
  Widget buildDesktop(BuildContext context) =>
      const FeatureContectResponsive(200);
  @override
  Widget buildMobile(BuildContext context) =>
      const FeatureContectResponsive(24);
}

class FeatureContectResponsive extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final horizontalPadding;

  const FeatureContectResponsive(this.horizontalPadding, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            const Text(
              "Features Section",
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
            Container(
              width: 800,
              height: 450,
              child:
                  HtmlElementView(viewType: 'youtube-video', key: UniqueKey()),
            )
          ],
        ),
      ),
    );
  }
}
