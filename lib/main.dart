import 'package:flutter/material.dart';

import 'entry_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'バーチャル背景ジェネレーター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EntryFormPage(),
    );
  }
}
