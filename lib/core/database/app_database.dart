import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// テーブル定義をインポート
import 'tables/memo_table.dart';

part 'app_database.g.dart';

/// アプリケーションのメインデータベースクラス
/// 
/// Driftを使用してローカルデータベースを管理します。
/// メモテーブルのみを含みます（メモ一覧は表示のみの用途）。
@DriftDatabase(tables: [MemoTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 将来のマイグレーション処理をここに記述
      },
    );
  }
}

/// データベース接続を開く
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'memo_app.db'));
    return NativeDatabase.createInBackground(file);
  });
}