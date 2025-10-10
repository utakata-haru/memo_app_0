import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/database_providers.dart';

/// メインアプリケーションウィジェット
/// 
/// go_routerを使用したルーティングとRiverpodによる状態管理を設定します。
class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データベースの初期化を確実に行う
    useEffect(() {
      // アプリケーション起動時にデータベースを初期化
      final database = ref.read(appDatabaseProvider);
      // データベースインスタンスを取得することで初期化を確実に実行
      // Driftのマイグレーション戦略により、テーブルが自動的に作成される
      debugPrint('Database initialized: ${database.runtimeType}');
      return null;
    }, []);

    return MaterialApp.router(
      title: 'メモアプリ',
      
      // テーマ設定
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      
      // go_routerの設定
      routerConfig: AppRouter.router,
      
      // デバッグバナーを非表示
      debugShowCheckedModeBanner: false,
    );
  }
}