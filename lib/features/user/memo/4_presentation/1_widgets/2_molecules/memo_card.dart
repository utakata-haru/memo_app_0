import 'package:flutter/material.dart';
import '../../../1_domain/1_entities/memo_entity.dart';

/// メモ情報を表示するカードMoleculeコンポーネント
/// 
/// メモの内容、作成日時、アクションメニューを含むカード形式の表示を提供します。
class MemoCard extends StatelessWidget {
  /// 表示するメモ
  final MemoEntity memo;
  
  /// カードがタップされた時のコールバック
  final VoidCallback? onTap;
  
  /// 編集アクションのコールバック
  final VoidCallback? onEdit;
  
  /// 削除アクションのコールバック
  final VoidCallback? onDelete;

  const MemoCard({
    super.key,
    required this.memo,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          memo.context,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: memo.createdAt != null
            ? Text(
                '作成日: ${_formatDate(memo.createdAt!)}',
                style: Theme.of(context).textTheme.bodySmall,
              )
            : null,
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleMenuAction(value),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('編集'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('削除', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  /// メニューアクションの処理
  void _handleMenuAction(String action) {
    switch (action) {
      case 'edit':
        onEdit?.call();
        break;
      case 'delete':
        onDelete?.call();
        break;
    }
  }

  /// 日付のフォーマット
  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')} '
           '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}