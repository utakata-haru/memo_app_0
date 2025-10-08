// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoListEntityImpl _$$MemoListEntityImplFromJson(Map<String, dynamic> json) =>
    _$MemoListEntityImpl(
      memos:
          (json['memos'] as List<dynamic>?)
              ?.map((e) => MemoEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MemoListEntityImplToJson(
  _$MemoListEntityImpl instance,
) => <String, dynamic>{'memos': instance.memos};
