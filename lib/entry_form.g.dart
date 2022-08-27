// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntryForm _$$_EntryFormFromJson(Map<String, dynamic> json) => _$_EntryForm(
      takingAbout: json['takingAbout'] as String? ?? "",
      name: json['name'] as String? ?? "",
      times: json['times'] as String? ?? "",
      twitter: json['twitter'] as String? ?? "",
      description: json['description'] as String? ?? "",
      iconUrl: json['iconUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$_EntryFormToJson(_$_EntryForm instance) =>
    <String, dynamic>{
      'takingAbout': instance.takingAbout,
      'name': instance.name,
      'times': instance.times,
      'twitter': instance.twitter,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
    };
