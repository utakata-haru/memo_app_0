import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../3_application/3_notifiers/memo_list_notifier.dart';
import '../../3_application/1_states/memo_list_state.dart';
import '../1_widgets/3_organisms/memo_list.dart';
import '../1_widgets/2_molecules/confirmation_dialog.dart';

import '../../../../../core/routing/app_routes.dart';

/// メモ一覧を表示するページ
/// 
/// 全てのメモを一覧表示し、メモの作成・編集・削除機能を提供します。
class MemoListPage extends HookConsumerWidget {
  const MemoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoListState = ref.watch(memoListNotifierProvider);

    // ページ初期化時にメモ一覧を読み込み
    useEffect(() {
      Future.microtask(() {
        ref.read(memoListNotifierProvider.notifier).getMemoList();
      });
      return null;
    }, const []);

    return PopScope(
      canPop: false, // デフォルトの戻る動作を無効化
      onPopInvokedWithResult: (didPop, result) {
        // 一覧ページでは何もしない（アプリを落とさない）
        // スワイプジェスチャーや戻るボタンが押されても無視
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('メモ一覧'),
          actions: [
            // 新規メモ作成ボタン
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _navigateToCreateMemo(context),
              tooltip: '新しいメモを作成',
            ),
            // リフレッシュボタン
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.read(memoListNotifierProvider.notifier).refresh();
              },
              tooltip: 'リフレッシュ',
            ),
          ],
        ),
        body: _buildBody(context, ref, memoListState),
      ),
    );
  }

  /// メイン画面の構築
  Widget _buildBody(BuildContext context, WidgetRef ref, MemoListState state) {
    return state.when(
      initial: () => const MemoList(isLoading: true),
      loading: () => const MemoList(isLoading: true),
      loaded: (memos) => MemoList(
        memos: memos,
        onMemoTap: (memo) => _navigateToMemoDetail(context, memo.id),
        onMemoEdit: (memo) => _navigateToEditMemo(context, memo.id),
        onMemoDelete: (memo) => _showDeleteConfirmation(context, ref, memo.id),
        onCreateMemo: () => _navigateToCreateMemo(context),
        onRefresh: () async {
          ref.read(memoListNotifierProvider.notifier).refresh();
        },
      ),
      error: (message) => MemoList(
        errorMessage: message,
        onRetry: () {
          ref.read(memoListNotifierProvider.notifier).getMemoList();
        },
      ),
    );
  }





  /// 削除確認ダイアログの表示
  void _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
    String memoId,
  ) {
    ConfirmationDialog.showDelete(
      context,
      content: 'このメモを削除しますか？\nこの操作は取り消せません。',
    ).then((confirmed) async {
      if (confirmed == true) {
        try {
          // メモ削除機能の実装（DeleteMemoUseCaseを使用）
          await ref.read(memoListNotifierProvider.notifier).deleteMemo(memoId);
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('メモを削除しました')),
            );
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('削除に失敗しました: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    });
  }

  /// メモ詳細ページへの遷移
  void _navigateToMemoDetail(BuildContext context, String memoId) {
    context.go(AppRoutes.generateMemoDetailPath(memoId));
  }

  /// メモ作成ページへの遷移
  void _navigateToCreateMemo(BuildContext context) {
    context.go(AppRoutes.memoCreate);
  }

  /// メモ編集ページへの遷移
  void _navigateToEditMemo(BuildContext context, String memoId) {
    context.go(AppRoutes.generateMemoEditPath(memoId));
  }


}