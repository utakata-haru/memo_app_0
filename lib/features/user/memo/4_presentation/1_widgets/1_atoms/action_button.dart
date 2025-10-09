import 'package:flutter/material.dart';

/// 基本的なアクションボタンAtomコンポーネント
/// 
/// アプリケーション全体で統一されたボタンスタイルを提供します。
class ActionButton extends StatelessWidget {
  /// ボタンのラベル
  final String label;
  
  /// ボタンのアイコン
  final IconData? icon;
  
  /// ボタンが押された時のコールバック
  final VoidCallback? onPressed;
  
  /// ボタンのスタイル
  final ActionButtonStyle style;
  
  /// ローディング状態
  final bool isLoading;

  const ActionButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.style = ActionButtonStyle.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child = isLoading
        ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon),
                  const SizedBox(width: 8),
                  Text(label),
                ],
              )
            : Text(label);

    switch (style) {
      case ActionButtonStyle.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case ActionButtonStyle.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case ActionButtonStyle.danger:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            foregroundColor: Colors.red,
          ),
          child: child,
        );
      case ActionButtonStyle.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          child: child,
        );
      case ActionButtonStyle.unified:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
            foregroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
          child: child,
        );
    }
  }
}

/// ボタンのスタイル種別
enum ActionButtonStyle {
  /// プライマリボタン（塗りつぶし）
  primary,
  
  /// セカンダリボタン（アウトライン）
  secondary,
  
  /// 危険なアクション用ボタン（赤色アウトライン）
  danger,
  
  /// テキストボタン
  text,
  
  /// 統一されたアウトラインボタン（キャンセル・保存ボタン用）
  unified,
}

/// アイコンボタンAtomコンポーネント
class ActionIconButton extends StatelessWidget {
  /// ボタンのアイコン
  final IconData icon;
  
  /// ボタンが押された時のコールバック
  final VoidCallback? onPressed;
  
  /// ツールチップテキスト
  final String? tooltip;
  
  /// アイコンの色
  final Color? color;

  const ActionIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: color),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}