// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntryForm _$EntryFormFromJson(Map<String, dynamic> json) {
  return _EntryForm.fromJson(json);
}

/// @nodoc
mixin _$EntryForm {
  String get takingAbout => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get times => throw _privateConstructorUsedError;
  String get twitter => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryFormCopyWith<EntryForm> get copyWith =>
      throw _privateConstructorUsedError;
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
      String description,
      String iconUrl});
}

/// @nodoc
class _$EntryFormCopyWithImpl<$Res> implements $EntryFormCopyWith<$Res> {
  _$EntryFormCopyWithImpl(this._value, this._then);

  final EntryForm _value;
  // ignore: unused_field
  final $Res Function(EntryForm) _then;

  @override
  $Res call({
    Object? takingAbout = freezed,
    Object? name = freezed,
    Object? times = freezed,
    Object? twitter = freezed,
    Object? description = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      takingAbout: takingAbout == freezed
          ? _value.takingAbout
          : takingAbout // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EntryFormCopyWith<$Res> implements $EntryFormCopyWith<$Res> {
  factory _$$_EntryFormCopyWith(
          _$_EntryForm value, $Res Function(_$_EntryForm) then) =
      __$$_EntryFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String takingAbout,
      String name,
      String times,
      String twitter,
      String description,
      String iconUrl});
}

/// @nodoc
class __$$_EntryFormCopyWithImpl<$Res> extends _$EntryFormCopyWithImpl<$Res>
    implements _$$_EntryFormCopyWith<$Res> {
  __$$_EntryFormCopyWithImpl(
      _$_EntryForm _value, $Res Function(_$_EntryForm) _then)
      : super(_value, (v) => _then(v as _$_EntryForm));

  @override
  _$_EntryForm get _value => super._value as _$_EntryForm;

  @override
  $Res call({
    Object? takingAbout = freezed,
    Object? name = freezed,
    Object? times = freezed,
    Object? twitter = freezed,
    Object? description = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$_EntryForm(
      takingAbout: takingAbout == freezed
          ? _value.takingAbout
          : takingAbout // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as String,
      twitter: twitter == freezed
          ? _value.twitter
          : twitter // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntryForm with DiagnosticableTreeMixin implements _EntryForm {
  const _$_EntryForm(
      {this.takingAbout = "",
      this.name = "",
      this.times = "",
      this.twitter = "",
      this.description = "",
      this.iconUrl = ""});

  factory _$_EntryForm.fromJson(Map<String, dynamic> json) =>
      _$$_EntryFormFromJson(json);

  @override
  @JsonKey()
  final String takingAbout;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String times;
  @override
  @JsonKey()
  final String twitter;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String iconUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EntryForm(takingAbout: $takingAbout, name: $name, times: $times, twitter: $twitter, description: $description, iconUrl: $iconUrl)';
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
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('iconUrl', iconUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntryForm &&
            const DeepCollectionEquality()
                .equals(other.takingAbout, takingAbout) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.times, times) &&
            const DeepCollectionEquality().equals(other.twitter, twitter) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.iconUrl, iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(takingAbout),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(times),
      const DeepCollectionEquality().hash(twitter),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(iconUrl));

  @JsonKey(ignore: true)
  @override
  _$$_EntryFormCopyWith<_$_EntryForm> get copyWith =>
      __$$_EntryFormCopyWithImpl<_$_EntryForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntryFormToJson(
      this,
    );
  }
}

abstract class _EntryForm implements EntryForm {
  const factory _EntryForm(
      {final String takingAbout,
      final String name,
      final String times,
      final String twitter,
      final String description,
      final String iconUrl}) = _$_EntryForm;

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
  String get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$_EntryFormCopyWith<_$_EntryForm> get copyWith =>
      throw _privateConstructorUsedError;
}
