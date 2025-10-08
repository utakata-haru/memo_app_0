import 'package:flutter/material.dart';
import '../1_atoms/error_icon.dart';
import '../1_atoms/action_button.dart';

/// エラー状態を表示するMoleculeコンポーネント
/// 
/// エラーメッセージと再試行ボタンを含む統一されたエラー表示を提供します。
class ErrorDisplay extends StatelessWidget {
  /// エラーメッセージ
  final String message;
  
  /// 再試行ボタンのコールバック
  final VoidCallback? onRetry;
  
  /// 再試行ボタンのラベル
  final String retryLabel;

  const ErrorDisplay({
    super.key,
    required this.message,
    this.onRetry,
    this.retryLabel = '再試行',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ErrorIcon(),
          const SizedBox(height: 16),
          Text(
            'エラーが発生しました',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ActionButton(
              label: retryLabel,
              onPressed: onRetry,
            ),
          ],
        ],
      ),
    );
  }
}