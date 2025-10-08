import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_entity.freezed.dart';
part 'memo_entity.g.dart';

@freezed
class  MemoEntity with _$MemoEntity{
    const factory MemoEntity({
      required String id,
      required String context,
      DateTime? createdAt,
      DateTime? updatedAt,
    })=_MemoEntity;

    factory MemoEntity.fromJson(Map<String,dynamic>json) =>
    _$MemoEntityFromJson(json);
}