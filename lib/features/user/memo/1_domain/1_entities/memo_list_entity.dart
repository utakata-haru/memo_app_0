import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'memo_entity.dart';

part 'memo_list_entity.freezed.dart';
part 'memo_list_entity.g.dart';

/// メモを一覧表示するためのエンティティ（単一のグローバルリストとして利用）
@freezed
class MemoListEntity with _$MemoListEntity {
  const factory MemoListEntity({
    /// 全メモのリスト
    @Default([]) List<MemoEntity> memos,
  }) = _MemoListEntity;

  factory MemoListEntity.fromJson(Map<String, dynamic> json) =>
      _$MemoListEntityFromJson(json);
}