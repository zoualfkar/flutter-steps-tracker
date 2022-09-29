// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  int get i => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int i) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int i)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int i)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({int i});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? i = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_RefreshCopyWith(
          _$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
  @override
  $Res call({int i});
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, (v) => _then(v as _$_Refresh));

  @override
  _$_Refresh get _value => super._value as _$_Refresh;

  @override
  $Res call({
    Object? i = freezed,
  }) {
    return _then(_$_Refresh(
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh({required this.i});

  @override
  final int i;

  @override
  String toString() {
    return 'AppState.refresh(i: $i)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Refresh &&
            const DeepCollectionEquality().equals(other.i, i));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(i));

  @JsonKey(ignore: true)
  @override
  _$$_RefreshCopyWith<_$_Refresh> get copyWith =>
      __$$_RefreshCopyWithImpl<_$_Refresh>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int i) refresh,
  }) {
    return refresh(i);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int i)? refresh,
  }) {
    return refresh?.call(i);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int i)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements AppState {
  const factory _Refresh({required final int i}) = _$_Refresh;

  @override
  int get i;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshCopyWith<_$_Refresh> get copyWith =>
      throw _privateConstructorUsedError;
}
