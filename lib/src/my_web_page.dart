import 'package:flutter_pagina_web/src/content/contact_content.dart';
import 'package:flutter_pagina_web/src/content/features_content.dart';
import 'package:flutter_pagina_web/src/content/home_content.dart';
import 'package:flutter_pagina_web/src/content/screenshots_content.dart';
import 'package:flutter_pagina_web/src/navigation_bar/nav_bart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final homeKey = new GlobalKey();
final featureKey = new GlobalKey();
final screenshotKey = new GlobalKey();
final contactKey = new GlobalKey();

final currentPageProvider = StateProvider<GlobalKey>((_) => homeKey);
final scrolledProvider = StateProvider<bool>((_) => false);

class MyWebPage extends HookConsumerWidget {
  const MyWebPage({super.key});

  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScrolled = ref.read(scrolledProvider.notifier).state;
    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.notifier).state = true;
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.notifier).state = false;
    }
  }

  void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
      duration: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useScrollController();

    useEffect(() {
      _controller.addListener(() => onScroll(_controller, ref));
      return _controller.dispose;
    }, [_controller]);

    double width = MediaQuery.of(context).size.width;
    double maxWith = width > 1200 ? 1200 : width;

    ref
        .watch(currentPageProvider.notifier)
        .addListener(scrollTo, fireImmediately: false);

    return Scaffold(
      body: Center(
        child: Container(
          width: maxWith,
          child: Column(
            children: [
              const NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      HomeContent(key: homeKey),
                      FeaturesContent(key: featureKey),
                      ScreenShotsContent(key: screenshotKey),
                      ContactContent(key: contactKey),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
