import 'package:flutter/material.dart';

/// エラー状態を表示するアイコンAtomコンポーネント
/// 
/// アプリケーション全体で統一されたエラーアイコン表示を提供します。
class ErrorIcon extends StatelessWidget {
  /// アイコンのサイズ
  final double size;
  
  /// アイコンの色
  final Color? color;

  const ErrorIcon({
    super.key,
    this.size = 64,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline,
      size: size,
      color: color ?? Colors.red,
    );
  }
}

/// 小さなエラーアイコン（インライン表示用）
class SmallErrorIcon extends StatelessWidget {
  /// アイコンの色
  final Color? color;

  const SmallErrorIcon({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline,
      size: 20,
      color: color ?? Colors.red,
    );
  }
}