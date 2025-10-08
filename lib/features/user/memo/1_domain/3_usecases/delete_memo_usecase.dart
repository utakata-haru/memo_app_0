import '../2_repositories/memo_repository.dart';
import '../../../../../core/validation/memo_validator.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// 指定されたIDのメモを削除するユースケース
/// 
/// このユースケースは、メモリポジトリを使用して
/// 既存のメモを削除するビジネスロジックを実装します。
class DeleteMemoUseCase {
  final MemoRepository _memoRepository;

  DeleteMemoUseCase(this._memoRepository);

  /// 指定されたIDのメモを削除します
  /// 
  /// [id] 削除対象のメモID
  /// 
  /// Throws:
  /// - [MemoValidationException] IDが無効な場合
  /// - [MemoNotFoundException] メモが見つからない場合
  /// - [MemoOperationException] メモ削除操作エラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<void> call(String id) async {
    // 入力検証
    MemoValidator.validateMemoId(id);

    // リポジトリでメモを削除
    await _memoRepository.deleteMemo(id);
  }
}