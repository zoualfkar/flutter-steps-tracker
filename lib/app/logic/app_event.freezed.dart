// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestRefresh value) requestRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestRefresh value)? requestRefresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestRefresh value)? requestRefresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res> implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  final AppEvent _value;
  // ignore: unused_field
  final $Res Function(AppEvent) _then;
}

/// @nodoc
abstract class _$$_RequestRefreshCopyWith<$Res> {
  factory _$$_RequestRefreshCopyWith(
          _$_RequestRefresh value, $Res Function(_$_RequestRefresh) then) =
      __$$_RequestRefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RequestRefreshCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_RequestRefreshCopyWith<$Res> {
  __$$_RequestRefreshCopyWithImpl(
      _$_RequestRefresh _value, $Res Function(_$_RequestRefresh) _then)
      : super(_value, (v) => _then(v as _$_RequestRefresh));

  @override
  _$_RequestRefresh get _value => super._value as _$_RequestRefresh;
}

/// @nodoc

class _$_RequestRefresh implements _RequestRefresh {
  const _$_RequestRefresh();

  @override
  String toString() {
    return 'AppEvent.requestRefresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RequestRefresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestRefresh,
  }) {
    return requestRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? requestRefresh,
  }) {
    return requestRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestRefresh,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestRefresh value) requestRefresh,
  }) {
    return requestRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RequestRefresh value)? requestRefresh,
  }) {
    return requestRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestRefresh value)? requestRefresh,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh(this);
    }
    return orElse();
  }
}

abstract class _RequestRefresh implements AppEvent {
  const factory _RequestRefresh() = _$_RequestRefresh;
}
