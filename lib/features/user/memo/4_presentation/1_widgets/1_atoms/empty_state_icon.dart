import 'package:flutter/material.dart';

/// 空の状態を表示するアイコンAtomコンポーネント
/// 
/// データが存在しない場合の統一されたアイコン表示を提供します。
class EmptyStateIcon extends StatelessWidget {
  /// アイコンの種類
  final IconData icon;
  
  /// アイコンのサイズ
  final double size;
  
  /// アイコンの色
  final Color? color;

  const EmptyStateIcon({
    super.key,
    required this.icon,
    this.size = 64,
    this.color,
  });

  /// メモが空の状態用のアイコン
  const EmptyStateIcon.memo({
    super.key,
    this.size = 64,
    this.color,
  }) : icon = Icons.note_add_outlined;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color ?? Colors.grey,
    );
  }
}