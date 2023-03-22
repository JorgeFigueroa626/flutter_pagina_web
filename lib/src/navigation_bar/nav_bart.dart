import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagina_web/src/my_web_page.dart';
import 'package:flutter_pagina_web/src/navigation_bar/nav_bar_button.dart';
import 'package:flutter_pagina_web/src/widget/responsive_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavBar();
  }
}

///PARA COMPUTADORAS
class DesktopNavBar extends HookConsumerWidget {
  const DesktopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrolled = ref.watch(scrolledProvider);
    final navBarColor = isScrolled ? Colors.blue : Colors.white;

    return Container(
      color: navBarColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              height: 40.0,
            ),
            const SizedBox(width: 10.0),
            const Text(
              "Red Social",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 32,
              ),
            ),
            Expanded(child: Container()),
            NavBarButton(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = homeKey,
                text: 'Home'),
            NavBarButton(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = featureKey,
                text: 'Features'),
            NavBarButton(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = screenshotKey,
                text: 'Screenshots'),
            NavBarButton(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = contactKey,
                text: 'Contect'),
          ],
        ),
      ),
    );
  }
}

///PARA CELULARES
class MobileNavBar extends HookConsumerWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = useState<double>(0.0);

    final isScrolled = ref.watch(scrolledProvider);
    final navBarColor = isScrolled ? Colors.blue : Colors.white;

    return Stack(
      children: [
        AnimatedContainer(
          margin: const EdgeInsets.only(top: 75.0),
          curve: Curves.ease,
          duration: const Duration(milliseconds: 350),
          height: containerHeight.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBarButton(
                  text: "Home",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = homeKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Features",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = featureKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Screenshots",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state =
                        screenshotKey;
                    containerHeight.value = 0;
                  },
                ),
                NavBarButton(
                  text: "Contact",
                  onTap: () {
                    ref.read(currentPageProvider.notifier).state = contactKey;
                    containerHeight.value = 0;
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          color: navBarColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  height: 30.0,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  "Red Social",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      fontSize: 32),
                ),
                Expanded(
                  child: Container(),
                ),
                Material(
                  child: InkWell(
                    splashColor: Colors.white60,
                    onTap: () {
                      final height = containerHeight.value > 0 ? 0.0 : 240.0;
                      containerHeight.value = height;
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
