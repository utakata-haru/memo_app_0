import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../database/app_database.dart';

part 'database_providers.g.dart';

/// AppDatabaseの依存性注入
/// 
/// アプリケーション全体で使用するデータベースインスタンスを提供します。
/// シングルトンとして管理され、アプリケーション起動時に一度だけ作成されます。
/// keepAlive: trueにより、プロバイダーが自動破棄されることを防ぎます。
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  
  // アプリケーション終了時にデータベースを適切にクローズ
  ref.onDispose(() {
    database.close();
  });
  
  return database;
}