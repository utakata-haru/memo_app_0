import 'package:flutter/material.dart';
import '../../../1_domain/1_entities/memo_entity.dart';
import '../2_molecules/memo_card.dart';
import '../2_molecules/empty_state_display.dart';
import '../2_molecules/error_display.dart';
import '../1_atoms/loading_indicator.dart';

/// メモ一覧を表示するOrganismコンポーネント
/// 
/// メモのリスト表示、空の状態、エラー状態、ローディング状態を管理します。
class MemoList extends StatelessWidget {
  /// 表示するメモのリスト
  final List<MemoEntity>? memos;
  
  /// ローディング状態
  final bool isLoading;
  
  /// エラーメッセージ
  final String? errorMessage;
  
  /// メモがタップされた時のコールバック
  final void Function(MemoEntity memo)? onMemoTap;
  
  /// メモの編集ボタンが押された時のコールバック
  final void Function(MemoEntity memo)? onMemoEdit;
  
  /// メモの削除ボタンが押された時のコールバック
  final void Function(MemoEntity memo)? onMemoDelete;
  
  /// 新規メモ作成ボタンが押された時のコールバック
  final VoidCallback? onCreateMemo;
  
  /// 再試行ボタンが押された時のコールバック
  final VoidCallback? onRetry;
  
  /// リフレッシュ時のコールバック
  final Future<void> Function()? onRefresh;

  const MemoList({
    super.key,
    this.memos,
    this.isLoading = false,
    this.errorMessage,
    this.onMemoTap,
    this.onMemoEdit,
    this.onMemoDelete,
    this.onCreateMemo,
    this.onRetry,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    // ローディング状態
    if (isLoading) {
      return const LoadingIndicator(message: 'メモを読み込み中...');
    }

    // エラー状態
    if (errorMessage != null) {
      return ErrorDisplay(
        message: errorMessage!,
        onRetry: onRetry,
      );
    }

    // メモが存在しない場合
    if (memos == null || memos!.isEmpty) {
      return EmptyStateDisplay.memo(
        onAction: onCreateMemo,
      );
    }

    // メモリストの表示
    Widget listView = ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: memos!.length,
      itemBuilder: (context, index) {
        final memo = memos![index];
        return MemoCard(
          memo: memo,
          onTap: () => onMemoTap?.call(memo),
          onEdit: () => onMemoEdit?.call(memo),
          onDelete: () => onMemoDelete?.call(memo),
        );
      },
    );

    // リフレッシュ機能付きの場合
    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        child: listView,
      );
    }

    return listView;
  }
}