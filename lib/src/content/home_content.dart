// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagina_web/src/widget/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

const googlePlayUrl =
    'https://play.google.com/store/apps/details?id=com.google.android.youtube';

const appStoreUrl =
    'https://play.google.com/store/apps/details?id=com.google.android.youtube';

class HomeContent extends ResponsiveWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopHomeContect();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileHomeContect();
  }
}

class DesktopHomeContect extends StatelessWidget {
  const DesktopHomeContect({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * .65,
      child: Row(
        children: [
          Container(
            width: width * .3,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/post1.jpg')),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Red Social - Android",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrlString(googlePlayUrl),
                      child: Image.asset(
                        'assets/images/google_play_badge.png',
                        height: 60,
                        width: 200,
                      ),
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () => launchUrlString(appStoreUrl),
                      child: Image.asset(
                        'assets/images/app_store_badge.png',
                        height: 60,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileHomeContect extends StatelessWidget {
  const MobileHomeContect({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Red Social - Adroind",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const SizedBox(height: 24),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => launchUrlString(googlePlayUrl),
            child: Image.asset(
              'assets/images/google_play_badge.png',
              height: 60,
              width: 200,
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => launchUrlString(appStoreUrl),
            child: Image.asset(
              'assets/images/app_store_badge.png',
              height: 60,
              width: 200,
            ),
          ),
          const SizedBox(height: 48),
          Image.asset(
            'assets/images/post1.jpg',
            height: 350,
          ),
        ],
      ),
    );
  }
}
