import 'package:flutter/material.dart';

/// ローディング状態を表示するAtomコンポーネント
/// 
/// アプリケーション全体で統一されたローディング表示を提供します。
class LoadingIndicator extends StatelessWidget {
  /// ローディングメッセージ
  final String? message;
  
  /// インジケーターのサイズ
  final double? size;

  const LoadingIndicator({
    super.key,
    this.message,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: const CircularProgressIndicator(),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// 小さなローディングインジケーター（ボタン内などで使用）
class SmallLoadingIndicator extends StatelessWidget {
  /// インジケーターの色
  final Color? color;
  
  /// ストロークの太さ
  final double strokeWidth;

  const SmallLoadingIndicator({
    super.key,
    this.color,
    this.strokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: color != null 
            ? AlwaysStoppedAnimation<Color>(color!)
            : null,
      ),
    );
  }
}