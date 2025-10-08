import 'package:json_annotation/json_annotation.dart' as json;
import 'package:drift/drift.dart';
import '../../1_domain/1_entities/memo_entity.dart';
import '../../../../../core/database/app_database.dart';

part 'memo_model.g.dart';

/// メモモデルクラス
/// 
/// MemoEntityとDriftテーブル、APIレスポンス間の変換を担当します。
/// データの永続化とシリアライゼーションを管理します。
@json.JsonSerializable()
class MemoModel {
  /// メモのユニークID
  final String id;
  
  /// メモの内容
  final String context;
  
  /// 作成日時（APIレスポンス用）
  @json.JsonKey(name: 'created_at')
  final DateTime? createdAt;
  
  /// 更新日時（APIレスポンス用）
  @json.JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const MemoModel({
    required this.id,
    required this.context,
    this.createdAt,
    this.updatedAt,
  });

  /// JSONからMemoModelを作成
  factory MemoModel.fromJson(Map<String, dynamic> json) =>
      _$MemoModelFromJson(json);

  /// MemoModelをJSONに変換
  Map<String, dynamic> toJson() => _$MemoModelToJson(this);

  /// MemoEntityからMemoModelを作成
  factory MemoModel.fromEntity(MemoEntity entity) {
    return MemoModel(
      id: entity.id,
      context: entity.context,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// MemoModelをMemoEntityに変換
  MemoEntity toEntity() {
    return MemoEntity(
      id: id,
      context: context,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// DriftのMemoTableDataからMemoModelを作成
  factory MemoModel.fromDrift(MemoTableData data) {
    return MemoModel(
      id: data.id,
      context: data.context,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  /// MemoModelをDriftのMemoTableCompanionに変換
  MemoTableCompanion toDriftCompanion() {
    return MemoTableCompanion(
      id: Value(id),
      context: Value(context),
    );
  }

  /// 更新用のDriftのMemoTableCompanionに変換
  MemoTableCompanion toDriftUpdateCompanion() {
    return MemoTableCompanion(
      id: Value(id),
      context: Value(context),
      updatedAt: Value(DateTime.now()),
    );
  }
}