// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginInitialState,
    required TResult Function(LoginData loginData) loginSuccessState,
    required TResult Function(String message) loginErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitialState value) loginInitialState,
    required TResult Function(_LoginSuccessState value) loginSuccessState,
    required TResult Function(_LoginErrorState value) loginErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class _$$_LoginInitialStateCopyWith<$Res> {
  factory _$$_LoginInitialStateCopyWith(_$_LoginInitialState value,
          $Res Function(_$_LoginInitialState) then) =
      __$$_LoginInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginInitialStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginInitialStateCopyWith<$Res> {
  __$$_LoginInitialStateCopyWithImpl(
      _$_LoginInitialState _value, $Res Function(_$_LoginInitialState) _then)
      : super(_value, (v) => _then(v as _$_LoginInitialState));

  @override
  _$_LoginInitialState get _value => super._value as _$_LoginInitialState;
}

/// @nodoc

class _$_LoginInitialState implements _LoginInitialState {
  const _$_LoginInitialState();

  @override
  String toString() {
    return 'LoginState.loginInitialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoginInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginInitialState,
    required TResult Function(LoginData loginData) loginSuccessState,
    required TResult Function(String message) loginErrorState,
  }) {
    return loginInitialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
  }) {
    return loginInitialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginInitialState != null) {
      return loginInitialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitialState value) loginInitialState,
    required TResult Function(_LoginSuccessState value) loginSuccessState,
    required TResult Function(_LoginErrorState value) loginErrorState,
  }) {
    return loginInitialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
  }) {
    return loginInitialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginInitialState != null) {
      return loginInitialState(this);
    }
    return orElse();
  }
}

abstract class _LoginInitialState implements LoginState {
  const factory _LoginInitialState() = _$_LoginInitialState;
}

/// @nodoc
abstract class _$$_LoginSuccessStateCopyWith<$Res> {
  factory _$$_LoginSuccessStateCopyWith(_$_LoginSuccessState value,
          $Res Function(_$_LoginSuccessState) then) =
      __$$_LoginSuccessStateCopyWithImpl<$Res>;
  $Res call({LoginData loginData});
}

/// @nodoc
class __$$_LoginSuccessStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginSuccessStateCopyWith<$Res> {
  __$$_LoginSuccessStateCopyWithImpl(
      _$_LoginSuccessState _value, $Res Function(_$_LoginSuccessState) _then)
      : super(_value, (v) => _then(v as _$_LoginSuccessState));

  @override
  _$_LoginSuccessState get _value => super._value as _$_LoginSuccessState;

  @override
  $Res call({
    Object? loginData = freezed,
  }) {
    return _then(_$_LoginSuccessState(
      loginData == freezed
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as LoginData,
    ));
  }
}

/// @nodoc

class _$_LoginSuccessState implements _LoginSuccessState {
  const _$_LoginSuccessState(this.loginData);

  @override
  final LoginData loginData;

  @override
  String toString() {
    return 'LoginState.loginSuccessState(loginData: $loginData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginSuccessState &&
            const DeepCollectionEquality().equals(other.loginData, loginData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(loginData));

  @JsonKey(ignore: true)
  @override
  _$$_LoginSuccessStateCopyWith<_$_LoginSuccessState> get copyWith =>
      __$$_LoginSuccessStateCopyWithImpl<_$_LoginSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginInitialState,
    required TResult Function(LoginData loginData) loginSuccessState,
    required TResult Function(String message) loginErrorState,
  }) {
    return loginSuccessState(loginData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
  }) {
    return loginSuccessState?.call(loginData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginSuccessState != null) {
      return loginSuccessState(loginData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitialState value) loginInitialState,
    required TResult Function(_LoginSuccessState value) loginSuccessState,
    required TResult Function(_LoginErrorState value) loginErrorState,
  }) {
    return loginSuccessState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
  }) {
    return loginSuccessState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginSuccessState != null) {
      return loginSuccessState(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccessState implements LoginState {
  const factory _LoginSuccessState(final LoginData loginData) =
      _$_LoginSuccessState;

  LoginData get loginData;
  @JsonKey(ignore: true)
  _$$_LoginSuccessStateCopyWith<_$_LoginSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginErrorStateCopyWith<$Res> {
  factory _$$_LoginErrorStateCopyWith(
          _$_LoginErrorState value, $Res Function(_$_LoginErrorState) then) =
      __$$_LoginErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_LoginErrorStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginErrorStateCopyWith<$Res> {
  __$$_LoginErrorStateCopyWithImpl(
      _$_LoginErrorState _value, $Res Function(_$_LoginErrorState) _then)
      : super(_value, (v) => _then(v as _$_LoginErrorState));

  @override
  _$_LoginErrorState get _value => super._value as _$_LoginErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_LoginErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginErrorState implements _LoginErrorState {
  const _$_LoginErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.loginErrorState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_LoginErrorStateCopyWith<_$_LoginErrorState> get copyWith =>
      __$$_LoginErrorStateCopyWithImpl<_$_LoginErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginInitialState,
    required TResult Function(LoginData loginData) loginSuccessState,
    required TResult Function(String message) loginErrorState,
  }) {
    return loginErrorState(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
  }) {
    return loginErrorState?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginInitialState,
    TResult Function(LoginData loginData)? loginSuccessState,
    TResult Function(String message)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginErrorState != null) {
      return loginErrorState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoginInitialState value) loginInitialState,
    required TResult Function(_LoginSuccessState value) loginSuccessState,
    required TResult Function(_LoginErrorState value) loginErrorState,
  }) {
    return loginErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
  }) {
    return loginErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoginInitialState value)? loginInitialState,
    TResult Function(_LoginSuccessState value)? loginSuccessState,
    TResult Function(_LoginErrorState value)? loginErrorState,
    required TResult orElse(),
  }) {
    if (loginErrorState != null) {
      return loginErrorState(this);
    }
    return orElse();
  }
}

abstract class _LoginErrorState implements LoginState {
  const factory _LoginErrorState(final String message) = _$_LoginErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$_LoginErrorStateCopyWith<_$_LoginErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
