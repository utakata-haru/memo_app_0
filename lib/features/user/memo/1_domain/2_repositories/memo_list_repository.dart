import '../1_entities/memo_list_entity.dart';

/// メモ一覧表示のデータアクセスを抽象化するリポジトリインターフェース
/// 
/// このインターフェースは、単一のグローバルなメモリストの取得と更新を定義します。
/// 具体的な実装はインフラ層で行われます。
abstract class MemoListRepository {
  /// メモの一覧を取得します
  /// 
  /// Returns: 全メモを含むメモリストエンティティ
  /// 
  /// Throws:
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoListEntity> getMemoList();
  
  /// メモリストの内容を更新します
  /// 
  /// [memoList] 更新するメモリストエンティティ
  /// 
  /// Returns: 更新されたメモリストエンティティ
  /// 
  /// Throws:
  /// - [ValidationException] バリデーションエラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoListEntity> updateMemoList(MemoListEntity memoList);
}