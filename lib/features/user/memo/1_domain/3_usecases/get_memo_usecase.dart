import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/validation/memo_validator.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// 指定されたIDのメモを取得するユースケース
/// 
/// このユースケースは、メモリポジトリを使用して
/// 特定のメモを取得するビジネスロジックを実装します。
class GetMemoUseCase {
  final MemoRepository _memoRepository;

  GetMemoUseCase(this._memoRepository);

  /// 指定されたIDのメモを取得します
  /// 
  /// [id] 取得対象のメモID
  /// 
  /// Returns: メモエンティティ
  /// 
  /// Throws:
  /// - [MemoValidationException] IDが無効な場合
  /// - [MemoNotFoundException] メモが見つからない場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> call(String id) async {
    // 入力検証
    MemoValidator.validateMemoId(id);

    // リポジトリからメモを取得
    final memo = await _memoRepository.getMemo(id);
    
    // メモが見つからない場合の処理
    if (memo == null) {
      throw Exception('メモが見つかりません: $id');
    }

    return memo;
  }
}