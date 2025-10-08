import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/user/memo/4_presentation/2_pages/memo_list_page.dart';
import '../../features/user/memo/4_presentation/2_pages/memo_detail_page.dart';
import '../../features/user/memo/4_presentation/2_pages/memo_edit_page.dart';

/// アプリケーション全体のルーティング設定
/// 
/// go_routerを使用して型安全で宣言的なルーティングを実現します。
class AppRouter {
  /// GoRouterのインスタンス
  static final GoRouter _router = GoRouter(
    // 初期ルート
    initialLocation: '/',
    
    // ルート定義
    routes: [
      // メモ一覧ページ（ホーム）
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MemoListPage(),
      ),
      
      // メモ作成ページ（具体的なパスを先に定義）
      GoRoute(
        path: '/memo/create',
        name: 'memo_create',
        builder: (context, state) => const MemoEditPage(),
      ),
      
      // メモ編集ページ（具体的なパスを先に定義）
      GoRoute(
        path: '/memo/:id/edit',
        name: 'memo_edit',
        builder: (context, state) {
          final memoId = state.pathParameters['id']!;
          return MemoEditPage(memoId: memoId);
        },
      ),
      
      // メモ詳細ページ（パラメータ付きパスは最後に定義）
      GoRoute(
        path: '/memo/:id',
        name: 'memo_detail',
        builder: (context, state) {
          final memoId = state.pathParameters['id']!;
          return MemoDetailPage(memoId: memoId);
        },
      ),
    ],
    
    // エラーページ
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'ページが見つかりません',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              state.error?.toString() ?? '不明なエラーが発生しました',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    ),
  );

  /// ルーターインスタンスを取得
  static GoRouter get router => _router;
}

/// ルーティング用の拡張メソッド
extension AppRouterExtension on BuildContext {
  /// メモ一覧ページに遷移
  void goToMemoList() => go('/');
  
  /// メモ詳細ページに遷移
  void goToMemoDetail(String memoId) => go('/memo/$memoId');
  
  /// メモ作成ページに遷移
  void goToMemoCreate() => go('/memo/create');
  
  /// メモ編集ページに遷移
  void goToMemoEdit(String memoId) => go('/memo/$memoId/edit');
  
  /// 前のページに戻る
  void goBack() => pop();
}