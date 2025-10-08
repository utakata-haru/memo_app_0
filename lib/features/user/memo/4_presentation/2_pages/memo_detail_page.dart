import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../3_application/3_notifiers/memo_notifier.dart';
import '../1_widgets/2_molecules/confirmation_dialog.dart';
import '../1_widgets/3_organisms/memo_detail_view.dart';
import '../../../../../core/routing/app_routes.dart';

/// メモの詳細を表示するページ
/// 
/// 指定されたIDのメモの詳細情報を表示し、編集・削除機能を提供します。
class MemoDetailPage extends HookConsumerWidget {
  /// 表示するメモのID
  final String memoId;

  const MemoDetailPage({
    super.key,
    required this.memoId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoState = ref.watch(memoNotifierProvider);

    // ページ初期化時にメモを読み込み
    useEffect(() {
      Future.microtask(() {
        ref.read(memoNotifierProvider.notifier).getMemo(memoId);
      });
      return null;
    }, [memoId]);

    return PopScope(
      canPop: false, // デフォルトの戻る動作を無効化
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // スワイプジェスチャーや戻るボタンが押された時に一覧画面に遷移
          context.go(AppRoutes.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('メモ詳細'),
          leading: IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'メモ一覧',
            onPressed: () => context.go(AppRoutes.home),
          ),
        ),
        body: memoState.when(
          initial: () => const MemoDetailView(isLoading: true),
          loading: () => const MemoDetailView(isLoading: true),
          loaded: (memo) => MemoDetailView(
            memo: memo,
            onEdit: () => _navigateToEditMemo(context),
            onDelete: () => _showDeleteConfirmation(context, ref),
          ),
          error: (message) => MemoDetailView(
            errorMessage: message,
            onRetry: () => ref.read(memoNotifierProvider.notifier).getMemo(memoId),
          ),
        ),
      ),
    );
  }





  /// 削除確認ダイアログの表示
  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    ConfirmationDialog.showDelete(
      context,
      content: 'このメモを削除しますか？\nこの操作は取り消せません。',
    ).then((confirmed) async {
      if (confirmed == true) {
        try {
          // メモ削除機能の実装（DeleteMemoUseCaseを使用）
          await ref.read(memoNotifierProvider.notifier).deleteMemo(memoId);
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('メモを削除しました')),
            );
            context.go(AppRoutes.home); // ホーム画面に戻る
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

  /// メモ編集ページへの遷移
  void _navigateToEditMemo(BuildContext context) {
    context.go(AppRoutes.generateMemoEditPath(memoId));
  }


}