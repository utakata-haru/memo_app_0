import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/routing/app_router.dart';

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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          
          // AppBarのテーマ
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
          
          // カードのテーマ
          cardTheme: CardThemeData(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          
          // ボタンのテーマ
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        
        // go_routerの設定
        routerConfig: AppRouter.router,
        
        // デバッグバナーを非表示
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}