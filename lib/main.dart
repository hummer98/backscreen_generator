import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        fontFamily: 'Noto Sans JP',
      ),
      // -----以下を追加-----
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ja", "JP"),
      ],
      home: EntryFormPage(),
    );
  }
}
