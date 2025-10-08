import '../1_entities/memo_list_entity.dart';
import '../2_repositories/memo_list_repository.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// メモ一覧を取得するユースケース
/// 
/// このユースケースは、メモリストリポジトリを使用して
/// 全てのメモを含む一覧を取得するビジネスロジックを実装します。
class GetMemoListUseCase {
  final MemoListRepository _memoListRepository;

  GetMemoListUseCase(this._memoListRepository);

  /// メモの一覧を取得します
  /// 
  /// Returns: 全メモを含むメモリストエンティティ
  /// 
  /// Throws:
  /// - [MemoListException] メモリスト取得エラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoListEntity> call() async {
    // リポジトリからメモ一覧を取得
    final memoList = await _memoListRepository.getMemoList();

    return memoList;
  }
}