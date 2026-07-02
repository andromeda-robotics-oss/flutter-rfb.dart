// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_frame_buffer_isolate_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoteFrameBufferIsolateInitMessage {
  String get hostName => throw _privateConstructorUsedError;
  Option<String> get password => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  Option<String> get unixSocketPath => throw _privateConstructorUsedError;

  /// The [SendPort] used for communicating with the caller.
  SendPort get sendPort => throw _privateConstructorUsedError;

  /// Create a copy of RemoteFrameBufferIsolateInitMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteFrameBufferIsolateInitMessageCopyWith<
          RemoteFrameBufferIsolateInitMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteFrameBufferIsolateInitMessageCopyWith<$Res> {
  factory $RemoteFrameBufferIsolateInitMessageCopyWith(
          RemoteFrameBufferIsolateInitMessage value,
          $Res Function(RemoteFrameBufferIsolateInitMessage) then) =
      _$RemoteFrameBufferIsolateInitMessageCopyWithImpl<$Res,
          RemoteFrameBufferIsolateInitMessage>;
  @useResult
  $Res call(
      {String hostName,
      Option<String> password,
      int port,
      Option<String> unixSocketPath,
      SendPort sendPort});
}

/// @nodoc
class _$RemoteFrameBufferIsolateInitMessageCopyWithImpl<$Res,
        $Val extends RemoteFrameBufferIsolateInitMessage>
    implements $RemoteFrameBufferIsolateInitMessageCopyWith<$Res> {
  _$RemoteFrameBufferIsolateInitMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteFrameBufferIsolateInitMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostName = null,
    Object? password = null,
    Object? port = null,
    Object? unixSocketPath = null,
    Object? sendPort = null,
  }) {
    return _then(_value.copyWith(
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      unixSocketPath: null == unixSocketPath
          ? _value.unixSocketPath
          : unixSocketPath // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      sendPort: null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateInitMessageImplCopyWith<$Res>
    implements $RemoteFrameBufferIsolateInitMessageCopyWith<$Res> {
  factory _$$RemoteFrameBufferIsolateInitMessageImplCopyWith(
          _$RemoteFrameBufferIsolateInitMessageImpl value,
          $Res Function(_$RemoteFrameBufferIsolateInitMessageImpl) then) =
      __$$RemoteFrameBufferIsolateInitMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hostName,
      Option<String> password,
      int port,
      Option<String> unixSocketPath,
      SendPort sendPort});
}

/// @nodoc
class __$$RemoteFrameBufferIsolateInitMessageImplCopyWithImpl<$Res>
    extends _$RemoteFrameBufferIsolateInitMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateInitMessageImpl>
    implements _$$RemoteFrameBufferIsolateInitMessageImplCopyWith<$Res> {
  __$$RemoteFrameBufferIsolateInitMessageImplCopyWithImpl(
      _$RemoteFrameBufferIsolateInitMessageImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateInitMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateInitMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostName = null,
    Object? password = null,
    Object? port = null,
    Object? unixSocketPath = null,
    Object? sendPort = null,
  }) {
    return _then(_$RemoteFrameBufferIsolateInitMessageImpl(
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      unixSocketPath: null == unixSocketPath
          ? _value.unixSocketPath
          : unixSocketPath // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      sendPort: null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
    ));
  }
}

/// @nodoc

class _$RemoteFrameBufferIsolateInitMessageImpl
    with DiagnosticableTreeMixin
    implements _RemoteFrameBufferIsolateInitMessage {
  const _$RemoteFrameBufferIsolateInitMessageImpl(
      {required this.hostName,
      required this.password,
      required this.port,
      required this.unixSocketPath,
      required this.sendPort});

  @override
  final String hostName;
  @override
  final Option<String> password;
  @override
  final int port;
  @override
  final Option<String> unixSocketPath;

  /// The [SendPort] used for communicating with the caller.
  @override
  final SendPort sendPort;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateInitMessage(hostName: $hostName, password: $password, port: $port, unixSocketPath: $unixSocketPath, sendPort: $sendPort)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RemoteFrameBufferIsolateInitMessage'))
      ..add(DiagnosticsProperty('hostName', hostName))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('port', port))
      ..add(DiagnosticsProperty('unixSocketPath', unixSocketPath))
      ..add(DiagnosticsProperty('sendPort', sendPort));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFrameBufferIsolateInitMessageImpl &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.unixSocketPath, unixSocketPath) ||
                other.unixSocketPath == unixSocketPath) &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hostName, password, port, unixSocketPath, sendPort);

  /// Create a copy of RemoteFrameBufferIsolateInitMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFrameBufferIsolateInitMessageImplCopyWith<
          _$RemoteFrameBufferIsolateInitMessageImpl>
      get copyWith => __$$RemoteFrameBufferIsolateInitMessageImplCopyWithImpl<
          _$RemoteFrameBufferIsolateInitMessageImpl>(this, _$identity);
}

abstract class _RemoteFrameBufferIsolateInitMessage
    implements RemoteFrameBufferIsolateInitMessage {
  const factory _RemoteFrameBufferIsolateInitMessage(
          {required final String hostName,
          required final Option<String> password,
          required final int port,
          required final Option<String> unixSocketPath,
          required final SendPort sendPort}) =
      _$RemoteFrameBufferIsolateInitMessageImpl;

  @override
  String get hostName;
  @override
  Option<String> get password;
  @override
  int get port;
  @override
  Option<String> get unixSocketPath;

  /// The [SendPort] used for communicating with the caller.
  @override
  SendPort get sendPort;

  /// Create a copy of RemoteFrameBufferIsolateInitMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFrameBufferIsolateInitMessageImplCopyWith<
          _$RemoteFrameBufferIsolateInitMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RemoteFrameBufferIsolateReceiveMessage {
  String get text => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)
        clipBoardUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)?
        clipBoardUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)?
        clipBoardUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RemoteFrameBufferIsolateReceiveMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteFrameBufferIsolateReceiveMessageCopyWith<
          RemoteFrameBufferIsolateReceiveMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteFrameBufferIsolateReceiveMessageCopyWith<$Res> {
  factory $RemoteFrameBufferIsolateReceiveMessageCopyWith(
          RemoteFrameBufferIsolateReceiveMessage value,
          $Res Function(RemoteFrameBufferIsolateReceiveMessage) then) =
      _$RemoteFrameBufferIsolateReceiveMessageCopyWithImpl<$Res,
          RemoteFrameBufferIsolateReceiveMessage>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$RemoteFrameBufferIsolateReceiveMessageCopyWithImpl<$Res,
        $Val extends RemoteFrameBufferIsolateReceiveMessage>
    implements $RemoteFrameBufferIsolateReceiveMessageCopyWith<$Res> {
  _$RemoteFrameBufferIsolateReceiveMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteFrameBufferIsolateReceiveMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWith<
    $Res> implements $RemoteFrameBufferIsolateReceiveMessageCopyWith<$Res> {
  factory _$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWith(
          _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl value,
          $Res Function(
                  _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl)
              then) =
      __$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWithImpl<
        $Res>
    extends _$RemoteFrameBufferIsolateReceiveMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl>
    implements
        _$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWith<
            $Res> {
  __$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWithImpl(
      _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateReceiveMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl
    with DiagnosticableTreeMixin
    implements RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate {
  const _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl(
      {required this.text});

  @override
  final String text;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateReceiveMessage.clipBoardUpdate(text: $text)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'RemoteFrameBufferIsolateReceiveMessage.clipBoardUpdate'))
      ..add(DiagnosticsProperty('text', text));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of RemoteFrameBufferIsolateReceiveMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWith<
          _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl>
      get copyWith =>
          __$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWithImpl<
                  _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
  }) {
    return clipBoardUpdate(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
  }) {
    return clipBoardUpdate?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    required TResult orElse(),
  }) {
    if (clipBoardUpdate != null) {
      return clipBoardUpdate(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)
        clipBoardUpdate,
  }) {
    return clipBoardUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)?
        clipBoardUpdate,
  }) {
    return clipBoardUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(
            RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate value)?
        clipBoardUpdate,
    required TResult orElse(),
  }) {
    if (clipBoardUpdate != null) {
      return clipBoardUpdate(this);
    }
    return orElse();
  }
}

abstract class RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate
    implements RemoteFrameBufferIsolateReceiveMessage {
  const factory RemoteFrameBufferIsolateReceiveMessageClipBoardUpdate(
          {required final String text}) =
      _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl;

  @override
  String get text;

  /// Create a copy of RemoteFrameBufferIsolateReceiveMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImplCopyWith<
          _$RemoteFrameBufferIsolateReceiveMessageClipBoardUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RemoteFrameBufferIsolateSendMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
    required TResult Function(bool down, int key) keyEvent,
    required TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)
        pointerEvent,
    required TResult Function() frameBufferUpdateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
    TResult? Function(bool down, int key)? keyEvent,
    TResult? Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult? Function()? frameBufferUpdateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    TResult Function(bool down, int key)? keyEvent,
    TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult Function()? frameBufferUpdateRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)
        clipBoardUpdate,
    required TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)
        keyEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessagePointerEvent value)
        pointerEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageUpdateRequest value)
        frameBufferUpdateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult? Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteFrameBufferIsolateSendMessageCopyWith<$Res> {
  factory $RemoteFrameBufferIsolateSendMessageCopyWith(
          RemoteFrameBufferIsolateSendMessage value,
          $Res Function(RemoteFrameBufferIsolateSendMessage) then) =
      _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
          RemoteFrameBufferIsolateSendMessage>;
}

/// @nodoc
class _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
        $Val extends RemoteFrameBufferIsolateSendMessage>
    implements $RemoteFrameBufferIsolateSendMessageCopyWith<$Res> {
  _$RemoteFrameBufferIsolateSendMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWith<
    $Res> {
  factory _$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWith(
          _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl value,
          $Res Function(
                  _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl)
              then) =
      __$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWithImpl<
        $Res>
    extends _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl>
    implements
        _$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWith<
            $Res> {
  __$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWithImpl(
      _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl
    with DiagnosticableTreeMixin
    implements RemoteFrameBufferIsolateSendMessageClipBoardUpdate {
  const _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl(
      {required this.text});

  @override
  final String text;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateSendMessage.clipBoardUpdate(text: $text)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'RemoteFrameBufferIsolateSendMessage.clipBoardUpdate'))
      ..add(DiagnosticsProperty('text', text));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl>
      get copyWith =>
          __$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWithImpl<
                  _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
    required TResult Function(bool down, int key) keyEvent,
    required TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)
        pointerEvent,
    required TResult Function() frameBufferUpdateRequest,
  }) {
    return clipBoardUpdate(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
    TResult? Function(bool down, int key)? keyEvent,
    TResult? Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult? Function()? frameBufferUpdateRequest,
  }) {
    return clipBoardUpdate?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    TResult Function(bool down, int key)? keyEvent,
    TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult Function()? frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (clipBoardUpdate != null) {
      return clipBoardUpdate(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)
        clipBoardUpdate,
    required TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)
        keyEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessagePointerEvent value)
        pointerEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageUpdateRequest value)
        frameBufferUpdateRequest,
  }) {
    return clipBoardUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult? Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
  }) {
    return clipBoardUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (clipBoardUpdate != null) {
      return clipBoardUpdate(this);
    }
    return orElse();
  }
}

abstract class RemoteFrameBufferIsolateSendMessageClipBoardUpdate
    implements RemoteFrameBufferIsolateSendMessage {
  const factory RemoteFrameBufferIsolateSendMessageClipBoardUpdate(
          {required final String text}) =
      _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl;

  String get text;

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessageClipBoardUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWith<
    $Res> {
  factory _$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWith(
          _$RemoteFrameBufferIsolateSendMessageKeyEventImpl value,
          $Res Function(_$RemoteFrameBufferIsolateSendMessageKeyEventImpl)
              then) =
      __$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool down, int key});
}

/// @nodoc
class __$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWithImpl<$Res>
    extends _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateSendMessageKeyEventImpl>
    implements
        _$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWith<$Res> {
  __$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWithImpl(
      _$RemoteFrameBufferIsolateSendMessageKeyEventImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateSendMessageKeyEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? down = null,
    Object? key = null,
  }) {
    return _then(_$RemoteFrameBufferIsolateSendMessageKeyEventImpl(
      down: null == down
          ? _value.down
          : down // ignore: cast_nullable_to_non_nullable
              as bool,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoteFrameBufferIsolateSendMessageKeyEventImpl
    with DiagnosticableTreeMixin
    implements RemoteFrameBufferIsolateSendMessageKeyEvent {
  const _$RemoteFrameBufferIsolateSendMessageKeyEventImpl(
      {required this.down, required this.key});

  @override
  final bool down;
  @override
  final int key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateSendMessage.keyEvent(down: $down, key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'RemoteFrameBufferIsolateSendMessage.keyEvent'))
      ..add(DiagnosticsProperty('down', down))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFrameBufferIsolateSendMessageKeyEventImpl &&
            (identical(other.down, down) || other.down == down) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, down, key);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessageKeyEventImpl>
      get copyWith =>
          __$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWithImpl<
                  _$RemoteFrameBufferIsolateSendMessageKeyEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
    required TResult Function(bool down, int key) keyEvent,
    required TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)
        pointerEvent,
    required TResult Function() frameBufferUpdateRequest,
  }) {
    return keyEvent(down, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
    TResult? Function(bool down, int key)? keyEvent,
    TResult? Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult? Function()? frameBufferUpdateRequest,
  }) {
    return keyEvent?.call(down, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    TResult Function(bool down, int key)? keyEvent,
    TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult Function()? frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (keyEvent != null) {
      return keyEvent(down, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)
        clipBoardUpdate,
    required TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)
        keyEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessagePointerEvent value)
        pointerEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageUpdateRequest value)
        frameBufferUpdateRequest,
  }) {
    return keyEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult? Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
  }) {
    return keyEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (keyEvent != null) {
      return keyEvent(this);
    }
    return orElse();
  }
}

abstract class RemoteFrameBufferIsolateSendMessageKeyEvent
    implements RemoteFrameBufferIsolateSendMessage {
  const factory RemoteFrameBufferIsolateSendMessageKeyEvent(
          {required final bool down, required final int key}) =
      _$RemoteFrameBufferIsolateSendMessageKeyEventImpl;

  bool get down;
  int get key;

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFrameBufferIsolateSendMessageKeyEventImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessageKeyEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWith<
    $Res> {
  factory _$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWith(
          _$RemoteFrameBufferIsolateSendMessagePointerEventImpl value,
          $Res Function(_$RemoteFrameBufferIsolateSendMessagePointerEventImpl)
              then) =
      __$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool button1Down,
      bool button2Down,
      bool button3Down,
      bool button4Down,
      bool button5Down,
      bool button6Down,
      bool button7Down,
      bool button8Down,
      int x,
      int y});
}

/// @nodoc
class __$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWithImpl<$Res>
    extends _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateSendMessagePointerEventImpl>
    implements
        _$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWith<$Res> {
  __$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWithImpl(
      _$RemoteFrameBufferIsolateSendMessagePointerEventImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateSendMessagePointerEventImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? button1Down = null,
    Object? button2Down = null,
    Object? button3Down = null,
    Object? button4Down = null,
    Object? button5Down = null,
    Object? button6Down = null,
    Object? button7Down = null,
    Object? button8Down = null,
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$RemoteFrameBufferIsolateSendMessagePointerEventImpl(
      button1Down: null == button1Down
          ? _value.button1Down
          : button1Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button2Down: null == button2Down
          ? _value.button2Down
          : button2Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button3Down: null == button3Down
          ? _value.button3Down
          : button3Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button4Down: null == button4Down
          ? _value.button4Down
          : button4Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button5Down: null == button5Down
          ? _value.button5Down
          : button5Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button6Down: null == button6Down
          ? _value.button6Down
          : button6Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button7Down: null == button7Down
          ? _value.button7Down
          : button7Down // ignore: cast_nullable_to_non_nullable
              as bool,
      button8Down: null == button8Down
          ? _value.button8Down
          : button8Down // ignore: cast_nullable_to_non_nullable
              as bool,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoteFrameBufferIsolateSendMessagePointerEventImpl
    with DiagnosticableTreeMixin
    implements RemoteFrameBufferIsolateSendMessagePointerEvent {
  const _$RemoteFrameBufferIsolateSendMessagePointerEventImpl(
      {required this.button1Down,
      required this.button2Down,
      required this.button3Down,
      required this.button4Down,
      required this.button5Down,
      required this.button6Down,
      required this.button7Down,
      required this.button8Down,
      required this.x,
      required this.y});

  @override
  final bool button1Down;
  @override
  final bool button2Down;
  @override
  final bool button3Down;
  @override
  final bool button4Down;
  @override
  final bool button5Down;
  @override
  final bool button6Down;
  @override
  final bool button7Down;
  @override
  final bool button8Down;
  @override
  final int x;
  @override
  final int y;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateSendMessage.pointerEvent(button1Down: $button1Down, button2Down: $button2Down, button3Down: $button3Down, button4Down: $button4Down, button5Down: $button5Down, button6Down: $button6Down, button7Down: $button7Down, button8Down: $button8Down, x: $x, y: $y)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'RemoteFrameBufferIsolateSendMessage.pointerEvent'))
      ..add(DiagnosticsProperty('button1Down', button1Down))
      ..add(DiagnosticsProperty('button2Down', button2Down))
      ..add(DiagnosticsProperty('button3Down', button3Down))
      ..add(DiagnosticsProperty('button4Down', button4Down))
      ..add(DiagnosticsProperty('button5Down', button5Down))
      ..add(DiagnosticsProperty('button6Down', button6Down))
      ..add(DiagnosticsProperty('button7Down', button7Down))
      ..add(DiagnosticsProperty('button8Down', button8Down))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFrameBufferIsolateSendMessagePointerEventImpl &&
            (identical(other.button1Down, button1Down) ||
                other.button1Down == button1Down) &&
            (identical(other.button2Down, button2Down) ||
                other.button2Down == button2Down) &&
            (identical(other.button3Down, button3Down) ||
                other.button3Down == button3Down) &&
            (identical(other.button4Down, button4Down) ||
                other.button4Down == button4Down) &&
            (identical(other.button5Down, button5Down) ||
                other.button5Down == button5Down) &&
            (identical(other.button6Down, button6Down) ||
                other.button6Down == button6Down) &&
            (identical(other.button7Down, button7Down) ||
                other.button7Down == button7Down) &&
            (identical(other.button8Down, button8Down) ||
                other.button8Down == button8Down) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      button1Down,
      button2Down,
      button3Down,
      button4Down,
      button5Down,
      button6Down,
      button7Down,
      button8Down,
      x,
      y);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessagePointerEventImpl>
      get copyWith =>
          __$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWithImpl<
                  _$RemoteFrameBufferIsolateSendMessagePointerEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
    required TResult Function(bool down, int key) keyEvent,
    required TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)
        pointerEvent,
    required TResult Function() frameBufferUpdateRequest,
  }) {
    return pointerEvent(button1Down, button2Down, button3Down, button4Down,
        button5Down, button6Down, button7Down, button8Down, x, y);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
    TResult? Function(bool down, int key)? keyEvent,
    TResult? Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult? Function()? frameBufferUpdateRequest,
  }) {
    return pointerEvent?.call(button1Down, button2Down, button3Down,
        button4Down, button5Down, button6Down, button7Down, button8Down, x, y);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    TResult Function(bool down, int key)? keyEvent,
    TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult Function()? frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (pointerEvent != null) {
      return pointerEvent(button1Down, button2Down, button3Down, button4Down,
          button5Down, button6Down, button7Down, button8Down, x, y);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)
        clipBoardUpdate,
    required TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)
        keyEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessagePointerEvent value)
        pointerEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageUpdateRequest value)
        frameBufferUpdateRequest,
  }) {
    return pointerEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult? Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
  }) {
    return pointerEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (pointerEvent != null) {
      return pointerEvent(this);
    }
    return orElse();
  }
}

abstract class RemoteFrameBufferIsolateSendMessagePointerEvent
    implements RemoteFrameBufferIsolateSendMessage {
  const factory RemoteFrameBufferIsolateSendMessagePointerEvent(
          {required final bool button1Down,
          required final bool button2Down,
          required final bool button3Down,
          required final bool button4Down,
          required final bool button5Down,
          required final bool button6Down,
          required final bool button7Down,
          required final bool button8Down,
          required final int x,
          required final int y}) =
      _$RemoteFrameBufferIsolateSendMessagePointerEventImpl;

  bool get button1Down;
  bool get button2Down;
  bool get button3Down;
  bool get button4Down;
  bool get button5Down;
  bool get button6Down;
  bool get button7Down;
  bool get button8Down;
  int get x;
  int get y;

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteFrameBufferIsolateSendMessagePointerEventImplCopyWith<
          _$RemoteFrameBufferIsolateSendMessagePointerEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWith<
    $Res> {
  factory _$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWith(
          _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl value,
          $Res Function(_$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl)
              then) =
      __$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWithImpl<
          $Res>;
}

/// @nodoc
class __$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWithImpl<$Res>
    extends _$RemoteFrameBufferIsolateSendMessageCopyWithImpl<$Res,
        _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl>
    implements
        _$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWith<$Res> {
  __$$RemoteFrameBufferIsolateSendMessageUpdateRequestImplCopyWithImpl(
      _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl _value,
      $Res Function(_$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl)
          _then)
      : super(_value, _then);

  /// Create a copy of RemoteFrameBufferIsolateSendMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl
    with DiagnosticableTreeMixin
    implements RemoteFrameBufferIsolateSendMessageUpdateRequest {
  const _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteFrameBufferIsolateSendMessage.frameBufferUpdateRequest()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type',
          'RemoteFrameBufferIsolateSendMessage.frameBufferUpdateRequest'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) clipBoardUpdate,
    required TResult Function(bool down, int key) keyEvent,
    required TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)
        pointerEvent,
    required TResult Function() frameBufferUpdateRequest,
  }) {
    return frameBufferUpdateRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? clipBoardUpdate,
    TResult? Function(bool down, int key)? keyEvent,
    TResult? Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult? Function()? frameBufferUpdateRequest,
  }) {
    return frameBufferUpdateRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? clipBoardUpdate,
    TResult Function(bool down, int key)? keyEvent,
    TResult Function(
            bool button1Down,
            bool button2Down,
            bool button3Down,
            bool button4Down,
            bool button5Down,
            bool button6Down,
            bool button7Down,
            bool button8Down,
            int x,
            int y)?
        pointerEvent,
    TResult Function()? frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (frameBufferUpdateRequest != null) {
      return frameBufferUpdateRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)
        clipBoardUpdate,
    required TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)
        keyEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessagePointerEvent value)
        pointerEvent,
    required TResult Function(
            RemoteFrameBufferIsolateSendMessageUpdateRequest value)
        frameBufferUpdateRequest,
  }) {
    return frameBufferUpdateRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult? Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult? Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
  }) {
    return frameBufferUpdateRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoteFrameBufferIsolateSendMessageClipBoardUpdate value)?
        clipBoardUpdate,
    TResult Function(RemoteFrameBufferIsolateSendMessageKeyEvent value)?
        keyEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessagePointerEvent value)?
        pointerEvent,
    TResult Function(RemoteFrameBufferIsolateSendMessageUpdateRequest value)?
        frameBufferUpdateRequest,
    required TResult orElse(),
  }) {
    if (frameBufferUpdateRequest != null) {
      return frameBufferUpdateRequest(this);
    }
    return orElse();
  }
}

abstract class RemoteFrameBufferIsolateSendMessageUpdateRequest
    implements RemoteFrameBufferIsolateSendMessage {
  const factory RemoteFrameBufferIsolateSendMessageUpdateRequest() =
      _$RemoteFrameBufferIsolateSendMessageUpdateRequestImpl;
}
