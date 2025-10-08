// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MemoListEntity _$MemoListEntityFromJson(Map<String, dynamic> json) {
  return _MemoListEntity.fromJson(json);
}

/// @nodoc
mixin _$MemoListEntity {
  /// 全メモのリスト
  List<MemoEntity> get memos => throw _privateConstructorUsedError;

  /// Serializes this MemoListEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemoListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemoListEntityCopyWith<MemoListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoListEntityCopyWith<$Res> {
  factory $MemoListEntityCopyWith(
    MemoListEntity value,
    $Res Function(MemoListEntity) then,
  ) = _$MemoListEntityCopyWithImpl<$Res, MemoListEntity>;
  @useResult
  $Res call({List<MemoEntity> memos});
}

/// @nodoc
class _$MemoListEntityCopyWithImpl<$Res, $Val extends MemoListEntity>
    implements $MemoListEntityCopyWith<$Res> {
  _$MemoListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemoListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? memos = null}) {
    return _then(
      _value.copyWith(
            memos: null == memos
                ? _value.memos
                : memos // ignore: cast_nullable_to_non_nullable
                      as List<MemoEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemoListEntityImplCopyWith<$Res>
    implements $MemoListEntityCopyWith<$Res> {
  factory _$$MemoListEntityImplCopyWith(
    _$MemoListEntityImpl value,
    $Res Function(_$MemoListEntityImpl) then,
  ) = __$$MemoListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MemoEntity> memos});
}

/// @nodoc
class __$$MemoListEntityImplCopyWithImpl<$Res>
    extends _$MemoListEntityCopyWithImpl<$Res, _$MemoListEntityImpl>
    implements _$$MemoListEntityImplCopyWith<$Res> {
  __$$MemoListEntityImplCopyWithImpl(
    _$MemoListEntityImpl _value,
    $Res Function(_$MemoListEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemoListEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? memos = null}) {
    return _then(
      _$MemoListEntityImpl(
        memos: null == memos
            ? _value._memos
            : memos // ignore: cast_nullable_to_non_nullable
                  as List<MemoEntity>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoListEntityImpl
    with DiagnosticableTreeMixin
    implements _MemoListEntity {
  const _$MemoListEntityImpl({final List<MemoEntity> memos = const []})
    : _memos = memos;

  factory _$MemoListEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoListEntityImplFromJson(json);

  /// 全メモのリスト
  final List<MemoEntity> _memos;

  /// 全メモのリスト
  @override
  @JsonKey()
  List<MemoEntity> get memos {
    if (_memos is EqualUnmodifiableListView) return _memos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memos);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemoListEntity(memos: $memos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemoListEntity'))
      ..add(DiagnosticsProperty('memos', memos));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoListEntityImpl &&
            const DeepCollectionEquality().equals(other._memos, _memos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_memos));

  /// Create a copy of MemoListEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoListEntityImplCopyWith<_$MemoListEntityImpl> get copyWith =>
      __$$MemoListEntityImplCopyWithImpl<_$MemoListEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoListEntityImplToJson(this);
  }
}

abstract class _MemoListEntity implements MemoListEntity {
  const factory _MemoListEntity({final List<MemoEntity> memos}) =
      _$MemoListEntityImpl;

  factory _MemoListEntity.fromJson(Map<String, dynamic> json) =
      _$MemoListEntityImpl.fromJson;

  /// 全メモのリスト
  @override
  List<MemoEntity> get memos;

  /// Create a copy of MemoListEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemoListEntityImplCopyWith<_$MemoListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
