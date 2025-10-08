import '../1_entities/memo_list_entity.dart';
import '../2_repositories/memo_list_repository.dart';
import '../../../../../core/exceptions.dart';
import '../exceptions.dart';

/// メモリストを更新するユースケース
/// 
/// このユースケースは、メモリストリポジトリを使用して
/// メモリストの内容を更新するビジネスロジックを実装します。
class UpdateMemoListUseCase {
  final MemoListRepository _memoListRepository;

  UpdateMemoListUseCase(this._memoListRepository);

  /// メモリストを更新します
  /// 
  /// [memoList] 更新するメモリストエンティティ
  /// 
  /// Returns: 更新されたメモリストエンティティ
  /// 
  /// Throws:
  /// - [MemoListException] メモリストが無効な場合
  /// - [MemoListException] メモリスト更新操作エラーの場合
  /// - [NetworkException] ネットワークエラーの場合
  /// - [DatabaseException] データベースエラーの場合
  Future<MemoListEntity> call(MemoListEntity memoList) async {
    // 入力検証
    if (memoList.memos.isEmpty) {
      // 空のリストも有効とする（全削除の場合）
      // 特別な検証は不要
    }

    // リポジトリでメモリストを更新
    final updatedMemoList = await _memoListRepository.updateMemoList(memoList);

    return updatedMemoList;
  }
}