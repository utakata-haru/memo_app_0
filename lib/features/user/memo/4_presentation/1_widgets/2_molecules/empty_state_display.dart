import 'package:flutter/material.dart';
import '../1_atoms/empty_state_icon.dart';
import '../1_atoms/action_button.dart';

/// 空の状態を表示するMoleculeコンポーネント
/// 
/// データが存在しない場合の統一された表示を提供します。
class EmptyStateDisplay extends StatelessWidget {
  /// 表示するアイコン
  final IconData icon;
  
  /// メインメッセージ
  final String title;
  
  /// サブメッセージ
  final String? subtitle;
  
  /// アクションボタンのラベル
  final String? actionLabel;
  
  /// アクションボタンのアイコン
  final IconData? actionIcon;
  
  /// アクションボタンのコールバック
  final VoidCallback? onAction;

  const EmptyStateDisplay({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.actionIcon,
    this.onAction,
  });

  /// メモが空の状態用のファクトリーコンストラクタ
  const EmptyStateDisplay.memo({
    super.key,
    this.title = 'メモがありません',
    this.subtitle = '新しいメモを作成してみましょう',
    this.actionLabel = 'メモを作成',
    this.actionIcon = Icons.add,
    this.onAction,
  }) : icon = Icons.note_add_outlined;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyStateIcon(icon: icon),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: 16),
            ActionButton(
              label: actionLabel!,
              icon: actionIcon,
              onPressed: onAction,
            ),
          ],
        ],
      ),
    );
  }
}