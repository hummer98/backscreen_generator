import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'entry_form.freezed.dart';
part 'entry_form.g.dart';

@freezed
class EntryForm with _$EntryForm {
  const factory EntryForm({
    required String takingAbout,
    required String name,
    required String times,
    required String twitter,
    required String description,
  }) = _EntryForm;

  factory EntryForm.fromJson(Map<String, dynamic> json) => _$EntryFormFromJson(json);
}
