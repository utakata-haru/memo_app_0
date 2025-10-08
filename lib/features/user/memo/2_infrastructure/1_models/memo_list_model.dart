import 'package:json_annotation/json_annotation.dart' as json;
import '../../1_domain/1_entities/memo_list_entity.dart';
import 'memo_model.dart';

part 'memo_list_model.g.dart';

/// メモリストモデルクラス
/// 
/// MemoListEntityとAPIレスポンス間の変換を担当します。
/// メモ一覧は表示のみの用途なので、最小限の構成です。
@json.JsonSerializable()
class MemoListModel {
  /// メモのリスト
  @json.JsonKey(name: 'memos')
  final List<MemoModel> memos;

  const MemoListModel({
    required this.memos,
  });

  /// JSONからMemoListModelを作成
  factory MemoListModel.fromJson(Map<String, dynamic> json) =>
      _$MemoListModelFromJson(json);

  /// MemoListModelをJSONに変換
  Map<String, dynamic> toJson() => _$MemoListModelToJson(this);

  /// MemoListEntityからMemoListModelを作成
  factory MemoListModel.fromEntity(MemoListEntity entity) {
    return MemoListModel(
      memos: entity.memos.map((memo) => MemoModel.fromEntity(memo)).toList(),
    );
  }

  /// MemoListModelをMemoListEntityに変換
  MemoListEntity toEntity() {
    return MemoListEntity(
      memos: memos.map((model) => model.toEntity()).toList(),
    );
  }

  /// MemoModelのリストからMemoListModelを作成
  factory MemoListModel.fromMemoModels(List<MemoModel> memoModels) {
    return MemoListModel(memos: memoModels);
  }
}