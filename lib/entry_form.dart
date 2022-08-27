import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'entry_form.freezed.dart';
part 'entry_form.g.dart';

@freezed
class EntryForm with _$EntryForm {
  const factory EntryForm({
    @Default("") String takingAbout,
    @Default("") String name,
    @Default("") String times,
    @Default("") String twitter,
    @Default("") String description,
    @Default("") String iconUrl,
  }) = _EntryForm;

  factory EntryForm.fromJson(Map<String, dynamic> json) => _$EntryFormFromJson(json);
}
