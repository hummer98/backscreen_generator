// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
EntryForm _$EntryFormFromJson(Map<String, dynamic> json) {
  return _EntryForm.fromJson(json);
}

/// @nodoc
class _$EntryFormTearOff {
  const _$EntryFormTearOff();

// ignore: unused_element
  _EntryForm call(
      {@required String takingAbout,
      @required String name,
      @required String times,
      @required String twitter,
      @required String description}) {
    return _EntryForm(
      takingAbout: takingAbout,
      name: name,
      times: times,
      twitter: twitter,
      description: description,
    );
  }

// ignore: unused_element
  EntryForm fromJson(Map<String, Object> json) {
    return EntryForm.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $EntryForm = _$EntryFormTearOff();

/// @nodoc
mixin _$EntryForm {
  String get takingAbout;
  String get name;
  String get times;
  String get twitter;
  String get description;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $EntryFormCopyWith<EntryForm> get copyWith;
}

/// @nodoc
abstract class $EntryFormCopyWith<$Res> {
  factory $EntryFormCopyWith(EntryForm value, $Res Function(EntryForm) then) =
      _$EntryFormCopyWithImpl<$Res>;
  $Res call(
      {String takingAbout,
      String name,
      String times,
      String twitter,
      String description});
}

/// @nodoc
class _$EntryFormCopyWithImpl<$Res> implements $EntryFormCopyWith<$Res> {
  _$EntryFormCopyWithImpl(this._value, this._then);

  final EntryForm _value;
  // ignore: unused_field
  final $Res Function(EntryForm) _then;

  @override
  $Res call({
    Object takingAbout = freezed,
    Object name = freezed,
    Object times = freezed,
    Object twitter = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      takingAbout:
          takingAbout == freezed ? _value.takingAbout : takingAbout as String,
      name: name == freezed ? _value.name : name as String,
      times: times == freezed ? _value.times : times as String,
      twitter: twitter == freezed ? _value.twitter : twitter as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

/// @nodoc
abstract class _$EntryFormCopyWith<$Res> implements $EntryFormCopyWith<$Res> {
  factory _$EntryFormCopyWith(
          _EntryForm value, $Res Function(_EntryForm) then) =
      __$EntryFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String takingAbout,
      String name,
      String times,
      String twitter,
      String description});
}

/// @nodoc
class __$EntryFormCopyWithImpl<$Res> extends _$EntryFormCopyWithImpl<$Res>
    implements _$EntryFormCopyWith<$Res> {
  __$EntryFormCopyWithImpl(_EntryForm _value, $Res Function(_EntryForm) _then)
      : super(_value, (v) => _then(v as _EntryForm));

  @override
  _EntryForm get _value => super._value as _EntryForm;

  @override
  $Res call({
    Object takingAbout = freezed,
    Object name = freezed,
    Object times = freezed,
    Object twitter = freezed,
    Object description = freezed,
  }) {
    return _then(_EntryForm(
      takingAbout:
          takingAbout == freezed ? _value.takingAbout : takingAbout as String,
      name: name == freezed ? _value.name : name as String,
      times: times == freezed ? _value.times : times as String,
      twitter: twitter == freezed ? _value.twitter : twitter as String,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EntryForm with DiagnosticableTreeMixin implements _EntryForm {
  const _$_EntryForm(
      {@required this.takingAbout,
      @required this.name,
      @required this.times,
      @required this.twitter,
      @required this.description})
      : assert(takingAbout != null),
        assert(name != null),
        assert(times != null),
        assert(twitter != null),
        assert(description != null);

  factory _$_EntryForm.fromJson(Map<String, dynamic> json) =>
      _$_$_EntryFormFromJson(json);

  @override
  final String takingAbout;
  @override
  final String name;
  @override
  final String times;
  @override
  final String twitter;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EntryForm(takingAbout: $takingAbout, name: $name, times: $times, twitter: $twitter, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EntryForm'))
      ..add(DiagnosticsProperty('takingAbout', takingAbout))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('times', times))
      ..add(DiagnosticsProperty('twitter', twitter))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EntryForm &&
            (identical(other.takingAbout, takingAbout) ||
                const DeepCollectionEquality()
                    .equals(other.takingAbout, takingAbout)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.times, times) ||
                const DeepCollectionEquality().equals(other.times, times)) &&
            (identical(other.twitter, twitter) ||
                const DeepCollectionEquality()
                    .equals(other.twitter, twitter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(takingAbout) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(times) ^
      const DeepCollectionEquality().hash(twitter) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$EntryFormCopyWith<_EntryForm> get copyWith =>
      __$EntryFormCopyWithImpl<_EntryForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EntryFormToJson(this);
  }
}

abstract class _EntryForm implements EntryForm {
  const factory _EntryForm(
      {@required String takingAbout,
      @required String name,
      @required String times,
      @required String twitter,
      @required String description}) = _$_EntryForm;

  factory _EntryForm.fromJson(Map<String, dynamic> json) =
      _$_EntryForm.fromJson;

  @override
  String get takingAbout;
  @override
  String get name;
  @override
  String get times;
  @override
  String get twitter;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$EntryFormCopyWith<_EntryForm> get copyWith;
}
