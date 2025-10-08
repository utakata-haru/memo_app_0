import '../../1_domain/1_entities/memo_entity.dart';
import '../../1_domain/2_repositories/memo_repository.dart';
import '../2_data_sources/1_local/memo_local_data_source.dart';
import '../1_models/memo_model.dart';
import '../2_data_sources/1_local/exceptions/local_data_source_exceptions.dart';
import '../../../../../../../core/exceptions/validation_exception.dart';
import '../../../../../../../core/exceptions/database_exception.dart';
import '../../../../../../../core/exceptions/not_found_exception.dart';

/// メモリポジトリの実装クラス
/// 
/// ローカルデータソースを使用してメモの永続化を管理します。
/// リモートデータソースは現在未実装です。
class MemoRepositoryImpl implements MemoRepository {
  final MemoLocalDataSource _localDataSource;

  MemoRepositoryImpl(
    this._localDataSource,
  );

  @override
  Future<MemoEntity?> getMemo(String id) async {
    try {
      // 1. ローカルキャッシュから取得を試行
      final localMemo = await _localDataSource.getMemo(id);
      if (localMemo != null) {
        return localMemo.toEntity();
      }

      // 2. リモートから取得（現在は空実装のため、ローカルのみ）
      // TODO: リモートデータソースが実装されたら有効化
      // final remoteMemo = await _remoteDataSource.getMemo(id);
      // if (remoteMemo != null) {
      //   // 3. ローカルキャッシュに保存
      //   final localModel = MemoModel.fromEntity(remoteMemo.toEntity());
      //   await _localDataSource.createMemo(localModel);
      //   return remoteMemo.toEntity();
      // }

      return null;
    } on LocalDataNotFoundException {
      // メモが見つからない場合はnullを返す
      return null;
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモの取得中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモの取得中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモの取得中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }

  @override
  Future<MemoEntity> createMemo(MemoEntity memo) async {
    try {
      // 1. ローカルに作成
      final memoModel = MemoModel.fromEntity(memo);
      final createdMemo = await _localDataSource.createMemo(memoModel);

      // 2. リモートに作成（現在は空実装のため、ローカルのみ）
      // TODO: リモートデータソースが実装されたら有効化
      // try {
      //   await _remoteDataSource.createMemo(memoModel);
      // } catch (e) {
      //   // リモート作成に失敗してもローカル作成は成功として扱う
      //   // ログ出力など必要に応じて処理
      // }

      return createdMemo.toEntity();
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモの作成中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモの作成中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモの作成中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }

  @override
  Future<MemoEntity> updateMemo(MemoEntity memo) async {
    try {
      // 1. ローカルを更新
      final memoModel = MemoModel.fromEntity(memo);
      final updatedMemo = await _localDataSource.updateMemo(memoModel);

      // 2. リモートを更新（現在は空実装のため、ローカルのみ）
      // TODO: リモートデータソースが実装されたら有効化
      // try {
      //   await _remoteDataSource.updateMemo(memo.id, memoModel);
      // } catch (e) {
      //   // リモート更新に失敗してもローカル更新は成功として扱う
      //   // ログ出力など必要に応じて処理
      // }

      return updatedMemo.toEntity();
    } on LocalDataNotFoundException catch (e) {
      throw NotFoundException(
        'メモが見つかりません: ${e.message}',
        cause: e,
      );
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモの更新中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモの更新中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモの更新中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }

  @override
  Future<void> deleteMemo(String id) async {
    try {
      // 1. ローカルから削除
      await _localDataSource.deleteMemo(id);

      // 2. リモートから削除（現在は空実装のため、ローカルのみ）
      // TODO: リモートデータソースが実装されたら有効化
      // try {
      //   await _remoteDataSource.deleteMemo(id);
      // } catch (e) {
      //   // リモート削除に失敗してもローカル削除は成功として扱う
      //   // ログ出力など必要に応じて処理
      // }
    } on LocalDataNotFoundException catch (e) {
      throw NotFoundException(
        '削除対象のメモが見つかりません: ${e.message}',
        cause: e,
      );
    } on LocalDatabaseException catch (e) {
      throw DatabaseException(
        'メモの削除中にデータベースエラーが発生しました: ${e.message}',
        cause: e,
      );
    } on LocalDataSourceException catch (e) {
      throw ValidationException(
        'メモの削除中にエラーが発生しました: ${e.message}',
        cause: e,
      );
    } catch (e) {
      throw ValidationException(
        'メモの削除中に予期しないエラーが発生しました: $e',
        cause: e is Exception ? e : null,
      );
    }
  }
}