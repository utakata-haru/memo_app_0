import 'package:uuid/uuid.dart';
import '../1_entities/memo_entity.dart';
import '../2_repositories/memo_repository.dart';
import '../../../../../core/validation/memo_validator.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// 新しいメモを作成するユースケース
/// 
/// このユースケースは、メモリポジトリを使用して
/// 新しいメモを作成するビジネスロジックを実装します。
class CreateMemoUseCase {
  final MemoRepository _memoRepository;

  CreateMemoUseCase(this._memoRepository);

  /// 新しいメモを作成します
  /// 
  /// [content] メモの内容
  /// 
  /// Returns: 作成されたメモエンティティ（IDが付与される）
  /// 
  /// Throws:
  /// - [MemoValidationException] 内容が無効な場合
  /// - [MemoOperationException] メモ作成操作エラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoEntity> call(String content) async {
    // 入力検証とトリミング
    final trimmedContent = MemoValidator.validateAndTrimMemoContent(content);

    // UUIDを生成
    const uuid = Uuid();
    final id = uuid.v4();

    // メモエンティティの作成
    final newMemo = MemoEntity(
      id: id,
      context: trimmedContent,
    );

    // リポジトリでメモを永続化
    final createdMemo = await _memoRepository.createMemo(newMemo);

    return createdMemo;
  }
}