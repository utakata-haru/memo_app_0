import '../../1_models/memo_model.dart';

/// メモのローカルデータソースインターフェース
/// 
/// デバイスのローカルストレージ（Drift）を使用してメモデータの
/// 基本的なCRUD操作を担当します。
abstract class MemoLocalDataSource {
  /// 指定されたIDのメモを取得
  /// 
  /// [id] メモのID
  /// 戻り値: メモが見つかった場合はMemoModel、見つからない場合はnull
  /// 例外: LocalDataSourceException データベースエラー時
  Future<MemoModel?> getMemo(String id);

  /// 全てのメモを取得（作成日時の降順）
  /// 
  /// 戻り値: メモのリスト（空の場合は空リスト）
  /// 例外: LocalDataSourceException データベースエラー時
  Future<List<MemoModel>> getAllMemos();

  /// メモを作成
  /// 
  /// [memo] 作成するメモ
  /// 戻り値: 作成されたメモ（IDが付与される）
  /// 例外: LocalDataSourceException データベースエラー時
  Future<MemoModel> createMemo(MemoModel memo);

  /// メモを更新
  /// 
  /// [memo] 更新するメモ
  /// 戻り値: 更新されたメモ
  /// 例外: LocalDataSourceException データベースエラー時、メモが見つからない場合
  Future<MemoModel> updateMemo(MemoModel memo);

  /// 指定されたIDのメモを削除
  /// 
  /// [id] 削除するメモのID
  /// 例外: LocalDataSourceException データベースエラー時、メモが見つからない場合
  Future<void> deleteMemo(String id);
}