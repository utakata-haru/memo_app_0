import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/validation/memo_validator.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// 既存のメモを更新するユースケース
/// 
/// このユースケースは、メモリポジトリを使用して
/// 既存のメモの内容を更新するビジネスロジックを実装します。
class UpdateMemoUseCase {
  final MemoRepository _memoRepository;

  UpdateMemoUseCase(this._memoRepository);

  /// 既存のメモを更新します
  /// 
  /// [id] 更新対象のメモID
  /// [content] 新しいメモの内容
  /// 
  /// Returns: 更新されたメモエンティティ
  /// 
  /// Throws:
  /// - [MemoValidationException] IDまたは内容が無効な場合
  /// - [MemoNotFoundException] メモが見つからない場合
  /// - [MemoOperationException] メモ更新操作エラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> call(String id, String content) async {
    // 入力検証
    MemoValidator.validateMemoId(id);
    final trimmedContent = MemoValidator.validateAndTrimMemoContent(content);

    // 更新するメモエンティティの作成
    final updatedMemo = MemoEntity(
      id: id,
      context: trimmedContent,
    );

    // リポジトリでメモを更新
    final result = await _memoRepository.updateMemo(updatedMemo);

    return result;
  }
}