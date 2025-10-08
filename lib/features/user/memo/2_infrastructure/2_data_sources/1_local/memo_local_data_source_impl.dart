import 'package:drift/drift.dart';
import '../../../../../../core/database/app_database.dart';
import '../../1_models/memo_model.dart';
import 'memo_local_data_source.dart';
import 'exceptions/local_data_source_exceptions.dart';

/// メモのローカルデータソース実装クラス
/// 
/// Driftを使用してメモデータの基本的なCRUD操作を実装します。
class MemoLocalDataSourceImpl implements MemoLocalDataSource {
  final AppDatabase _database;

  const MemoLocalDataSourceImpl(this._database);

  @override
  Future<MemoModel?> getMemo(String id) async {
    try {
      final memo = await (_database.select(_database.memoTable)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();
      
      return memo != null ? MemoModel.fromDrift(memo) : null;
    } catch (e) {
      throw LocalDatabaseException('メモの取得に失敗しました: $e');
    }
  }

  @override
  Future<List<MemoModel>> getAllMemos() async {
    try {
      final memos = await (_database.select(_database.memoTable)
            ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
          .get();
      
      return memos.map((memo) => MemoModel.fromDrift(memo)).toList();
    } catch (e) {
      throw LocalDatabaseException('メモ一覧の取得に失敗しました: $e');
    }
  }

  @override
  Future<MemoModel> createMemo(MemoModel memo) async {
    try {
      // メモを挿入し、生成されたIDを取得
      final insertedId = await _database.into(_database.memoTable).insertReturning(
        memo.toDriftCompanion(),
      );
      
      // 挿入されたデータからMemoModelを作成して返す
      return MemoModel.fromDrift(insertedId);
    } catch (e) {
      throw LocalDatabaseException('メモの作成に失敗しました: $e');
    }
  }

  @override
  Future<MemoModel> updateMemo(MemoModel memo) async {
    try {
      final updatedRows = await (_database.update(_database.memoTable)
            ..where((tbl) => tbl.id.equals(memo.id)))
          .write(memo.toDriftUpdateCompanion());
      
      if (updatedRows == 0) {
        throw LocalDataNotFoundException('更新対象のメモが見つかりません: ${memo.id}');
      }
      
      // 更新されたメモを取得して返す
      final updatedMemo = await getMemo(memo.id);
      if (updatedMemo == null) {
        throw LocalDatabaseException('更新されたメモの取得に失敗しました');
      }
      
      return updatedMemo;
    } catch (e) {
      if (e is LocalDataNotFoundException) rethrow;
      throw LocalDatabaseException('メモの更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteMemo(String id) async {
    try {
      final deletedRows = await (_database.delete(_database.memoTable)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      
      if (deletedRows == 0) {
        throw LocalDataNotFoundException('削除対象のメモが見つかりません: $id');
      }
    } catch (e) {
      if (e is LocalDataNotFoundException) rethrow;
      throw LocalDatabaseException('メモの削除に失敗しました: $e');
    }
  }
}