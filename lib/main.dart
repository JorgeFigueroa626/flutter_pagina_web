import 'package:flutter/material.dart';
import 'package:flutter_pagina_web/src/my_web_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: "Pagina Web Flutter",
        home: MyWebPage(),
      ),
    ),
  );
}
