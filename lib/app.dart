import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

/// メインアプリケーションウィジェット
/// 
/// go_routerを使用したルーティングとRiverpodによる状態管理を設定します。
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'メモアプリ',
        
        // テーマ設定
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        
        // go_routerの設定
        routerConfig: AppRouter.router,
        
        // デバッグバナーを非表示
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}