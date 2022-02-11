import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'entry_form_page.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'バーチャル背景ジェネレーター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Noto Sans JP',
      ),
      home: EntryFormPage(),
    );
  }
}
