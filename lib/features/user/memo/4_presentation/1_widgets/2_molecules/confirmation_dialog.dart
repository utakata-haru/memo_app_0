import 'package:flutter/material.dart';

/// 確認ダイアログMoleculeコンポーネント
/// 
/// 削除などの重要なアクションの確認ダイアログを提供します。
class ConfirmationDialog extends StatelessWidget {
  /// ダイアログのタイトル
  final String title;
  
  /// ダイアログの内容
  final String content;
  
  /// 確認ボタンのラベル
  final String confirmLabel;
  
  /// キャンセルボタンのラベル
  final String cancelLabel;
  
  /// 確認ボタンの色（危険なアクションの場合は赤色）
  final Color? confirmColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmLabel = '確認',
    this.cancelLabel = 'キャンセル',
    this.confirmColor,
  });

  /// 削除確認ダイアログ用のファクトリーコンストラクタ
  const ConfirmationDialog.delete({
    super.key,
    required this.content,
    this.title = 'メモを削除',
    this.confirmLabel = '削除',
    this.cancelLabel = 'キャンセル',
  }) : confirmColor = Colors.red;

  /// 破棄確認ダイアログ用のファクトリーコンストラクタ
  const ConfirmationDialog.discard({
    super.key,
    this.title = '変更を破棄',
    this.content = '変更内容が失われますが、よろしいですか？',
    this.confirmLabel = '破棄',
    this.cancelLabel = 'キャンセル',
  }) : confirmColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelLabel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: confirmColor != null
              ? TextButton.styleFrom(foregroundColor: confirmColor)
              : null,
          child: Text(confirmLabel),
        ),
      ],
    );
  }

  /// ダイアログを表示して結果を取得
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String content,
    String confirmLabel = '確認',
    String cancelLabel = 'キャンセル',
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: title,
        content: content,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        confirmColor: confirmColor,
      ),
    );
  }

  /// 削除確認ダイアログを表示
  static Future<bool?> showDelete(
    BuildContext context, {
    required String content,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ConfirmationDialog.delete(content: content),
    );
  }

  /// 破棄確認ダイアログを表示
  static Future<bool?> showDiscard(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const ConfirmationDialog.discard(),
    );
  }
}