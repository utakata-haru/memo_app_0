import '../../1_domain/1_entities/memo_list_entity.dart';
import '../../1_domain/2_repositories/memo_list_repository.dart';
import '../2_data_sources/1_local/memo_local_data_source.dart';

import '../2_data_sources/1_local/exceptions/local_data_source_exceptions.dart';
import '../../../../../../../core/exceptions/validation_exception.dart';
import '../../../../../../../core/exceptions/database_exception.dart';

/// メモリストリポジトリの実装クラス
/// 
/// ローカルデータソースを使用してメモリストの永続化を管理します。
/// リモートデータソースは現在未実装です。
class MemoListRepositoryImpl implements MemoListRepository {
  final MemoLocalDataSource _localDataSource;

  MemoListRepositoryImpl(
    this._localDataSource,
  );

  @override
  Future<MemoListEntity> getMemoList() async {
    try {
      // ローカルデータソースから全メモを取得
      final memoModels = await _localDataSource.getAllMemos();
      
      // MemoModelのリストをMemoEntityのリストに変換
      final memoEntities = memoModels.map((model) => model.toEntity()).toList();
      
      // MemoListEntityを作成して返す
      return MemoListEntity(
        memos: memoEntities,
      );
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモリストの取得中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモリストの取得中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモリストの取得中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }

  @override
  Future<MemoListEntity> updateMemoList(MemoListEntity memoList) async {
    try {
      // 現在の実装では、個別のメモ操作を通じてリストが更新されるため、
      // このメソッドは最新のメモリストを取得して返すだけです。
      // 将来的にバッチ更新が必要になった場合は、ここで実装します。
      
      // TODO: バッチ更新が必要な場合の実装
      // for (final memo in memoList.memos) {
      //   final memoModel = MemoModel.fromEntity(memo);
      //   await _localDataSource.updateMemo(memoModel);
      // }
      
      // 最新のメモリストを取得して返す
      return await getMemoList();
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモリストの更新中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモリストの更新中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモリストの更新中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }
}