import 'package:flutter/material.dart';
import '../../../1_domain/1_entities/memo_entity.dart';
import '../2_molecules/memo_info_card.dart';
import '../2_molecules/error_display.dart';
import '../1_atoms/loading_indicator.dart';
import '../1_atoms/action_button.dart';

/// メモの詳細を表示するOrganismコンポーネント
/// 
/// メモの内容、メタ情報、アクションボタンを統合して表示します。
class MemoDetailView extends StatelessWidget {
  /// 表示するメモ
  final MemoEntity? memo;
  
  /// ローディング状態
  final bool isLoading;
  
  /// エラーメッセージ
  final String? errorMessage;
  
  /// 編集ボタンが押された時のコールバック
  final VoidCallback? onEdit;
  
  /// 削除ボタンが押された時のコールバック
  final VoidCallback? onDelete;
  
  /// 再試行ボタンが押された時のコールバック
  final VoidCallback? onRetry;

  const MemoDetailView({
    super.key,
    this.memo,
    this.isLoading = false,
    this.errorMessage,
    this.onEdit,
    this.onDelete,
    this.onRetry,
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
    if (memo == null) {
      return const ErrorDisplay(
        message: 'メモが見つかりません',
      );
    }

    // メモ詳細の表示
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // メモ内容カード
          MemoInfoCard(memo: memo!),
          
          const SizedBox(height: 16),
          
          // メタ情報カード
          MemoMetaCard(memo: memo!),
          
          const SizedBox(height: 24),
          
          // アクションボタン
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: '編集',
                  icon: Icons.edit,
                  onPressed: onEdit,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ActionButton(
                  label: '削除',
                  icon: Icons.delete,
                  style: ActionButtonStyle.danger,
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}