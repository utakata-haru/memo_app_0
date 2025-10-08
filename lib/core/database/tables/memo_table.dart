import 'package:drift/drift.dart';

/// メモテーブルの定義
/// 
/// 個別のメモデータを格納するテーブルです。
/// IDと内容を持ちます。
class MemoTable extends Table {
  /// メモのユニークID（主キー）
  /// アプリケーション層でUUIDを生成して設定
  TextColumn get id => text()();
  
  /// メモの内容
  TextColumn get context => text()();
  
  /// 作成日時
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  /// 更新日時
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}