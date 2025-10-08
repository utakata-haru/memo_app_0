import '../1_entities/memo_entity.dart';

/// メモのデータアクセスを抽象化するリポジトリインターフェース
/// 
/// このインターフェースは、メモの基本的なCRUD操作を定義します。
/// 具体的な実装はインフラ層で行われます。
abstract class MemoRepository {
  /// 指定されたIDのメモを取得します
  /// 
  /// [id] メモの一意識別子
  /// 
  /// Returns: メモエンティティ。見つからない場合はnull
  /// 
  /// Throws:
  /// - [NotFoundException] メモが見つからない場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity?> getMemo(String id);
  
  /// 新しいメモを作成します
  /// 
  /// [memo] 作成するメモエンティティ
  /// 
  /// Returns: 作成されたメモエンティティ（IDなどが付与される）
  /// 
  /// Throws:
  /// - [ValidationException] バリデーションエラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> createMemo(MemoEntity memo);
  
  /// 既存のメモを更新します（編集・保存）
  /// 
  /// [memo] 更新するメモエンティティ
  /// 
  /// Returns: 更新されたメモエンティティ
  /// 
  /// Throws:
  /// - [ValidationException] バリデーションエラーの場合
  /// - [NotFoundException] メモが見つからない場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> updateMemo(MemoEntity memo);
  
  /// 指定されたIDのメモを削除します
  /// 
  /// [id] 削除するメモの一意識別子
  /// 
  /// Throws:
  /// - [NotFoundException] メモが見つからない場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<void> deleteMemo(String id);
}