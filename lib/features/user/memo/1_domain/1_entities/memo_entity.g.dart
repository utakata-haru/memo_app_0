// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoEntityImpl _$$MemoEntityImplFromJson(Map<String, dynamic> json) =>
    _$MemoEntityImpl(
      id: json['id'] as String,
      context: json['context'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MemoEntityImplToJson(_$MemoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'context': instance.context,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
