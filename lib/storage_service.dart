import 'dart:convert';

import 'package:backscreen_generator/entry_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _storageKey = 'EntryForm';

  static Future<EntryForm?> loadEntryForm() async {
    final sp = await SharedPreferences.getInstance();
    final data = sp.getString(_storageKey);
    return data == null ? null : EntryForm.fromJson(jsonDecode(data));
  }

  static Future<void> saveEntryForm(EntryForm entryForm) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(_storageKey, jsonEncode(entryForm));
  }
}
